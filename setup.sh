#! /bin/bash

# $? último return
# $! pid de último proceso
# $1 primer argumento
# > Syntax: file_descriptor > file_name
# >& Syntax: file_descriptor >& file_descriptor
# &> Syntax: &> file_name
# command -v busca commando en PATH

RESET="\033[0m"
RED="\033[0;31m"
GREEN="\033[0;32m"

SGOINFRE_PATH="/sgoinfre/students/$USER"
TEST_PATH="$HOME/atest"

function ft_error()
{
	if [ $? != 0 ]
	then
		printf $RED"$1 installation failed! Aborting...\n"$RESET
		exit
	else
		printf $GREEN"$1 installed.\n"$RESET
	fi
}

function setup_sgoinfre()
{
	find $SGOINFRE_PATH -maxdepth 0 &> /dev/null
	if [ $? == 0 ]
	then
		printf $GREEN"You have a sgoinfre folder. Good bunny. :)\n"$RESET
	else
		find /sgoinfre/students -maxdepth 0 &> /dev/null
		if [ $? != 0 ]
		then
			printf $RED"You don't seem to have sgoinfre at all...\nSorry, this script is not designed for this. Can't install."
			exit 1
		else
			printf $RED"BAD BUNNY! You don't have a sgoinfre folder.\n"$RESET"Set up a sgoinfre folder for you?\n(/sgoinfre/students/<yourusername>)\n"
			read reply
			if [ "$reply" != "${reply#[Yy]}" ]
			then
				echo "Setting up sgoinfre..."
				mkdir $SGOINFRE_PATH
				chmod 700 $SGOINFRE_PATH
			else
				printf $RED"I respect your desire, but I'm afraid you cannot continue."$RESET
				exit 1
			fi
		fi
	fi
}

function setup_brew()
{
	command -v brew &> /dev/null
	if [ $? == 0 ]
	then
		printf $GREEN"Brew already installed...\n"$RESET
	else
		echo "Installing brew..."
		mkdir $HOME/.brew && curl -fsSL https://github.com/Homebrew/brew/tarball/master | tar xz --strip 1 -C $HOME/.brew
		mkdir -p /tmp/.$(whoami)-brew-locks
		mkdir -p $HOME/.brew/var/homebrew
		ln -s /tmp/.$(whoami)-brew-locks $HOME/.brew/var/homebrew/locks
		export PATH="$HOME/.brew/bin:$PATH"
		brew update && brew upgrade
		mkdir -p /tmp/.$(whoami)-brew-locks
		export PATH="$HOME/.brew/bin:$PATH"
		echo "Exiling brew to sgoinfre (this may take a few minutes)..."
		mv ~/.brew $SGOINFRE_PATH/.brew
		ln -s $SGOINFRE_PATH/.brew ~/.brew
		command -v brew &> /dev/null
		ft_error Brew
	fi
}


function setup_kubectl()
{
	command -v kubectl &> /dev/null
	if [ $? == 0 ]
	then
		printf $GREEN"Kubectl already installed...\n"$RESET
	else
		echo "Installing kubectl..."
		brew install kubectl
		command -v kubectl &> /dev/null
		ft_error Kubectl
	fi
}

function setup_docker()
{
	command -v docker &> /dev/null
	if [ $? == 0 ]
	then
		printf $GREEN"Docker already installed...\n"$RESET
	else
		printf $RED"No Docker. Bad bunny. Please install Docker through the Managed Software Center before proceeding. :)\n"$RESET
		exit 1
	fi
}


function setup_minikube()
{
	command -v minikube &> /dev/null
	if [ $? == 0 ]
	then
		printf $GREEN"Minikube already installed...\n"$RESET
	else
		echo "Installing minikube..."
		brew install minikube
		echo "Exiling minikube to sgoinfre (this may take a few minutes)..."
		command -v minikube &> /dev/null
		ft_error Minikube
	fi
}

function setup_virtualbox()
{
	command -v virtualbox &> /dev/null
	if [ $? == 0 ]
	then
		printf $GREEN"VirtualBox installed... proceeding...\n"$RESET
		ps aux | grep VirtualBox | grep -v -e "grep VirtualBox" &> /dev/null
		if [ $? == 0 ]
		then
			printf $GREEN"VirtualBox already started... proceeding...\n"$RESET
		else
			echo "Starting VirtualBox..."
			virtualbox &
			sleep 4
			disown
		fi
	else
		echo "Please install Virtualbox through the Managed Software Center before proceeding. :)"
		exit 1
	fi
}

#launch virtualbox, minikube, siacaso mover minikube a sgoinfre si es primera vez...
function launch_minikube()
{
	find ~/.minikube -maxdepth 0 &> /dev/null
	if [ $? == 0 ]
	then
		echo "Resetting cluster..."
		minikube stop
		minikube delete
		minikube start --driver=virtualbox
		minikube status &> /dev/null
		if [ $? == 0 ]
		then
			printf $GREEN"Cluster started... proceeding...\n"$RESET
		else	
			printf $RED"Cluster start-up failed. Remove cluster from VirtualBox and delete .minikube directory before trying again.\n"$RESET
			exit 1
		fi
	else
		echo "Creating cluster..."
		minikube start --driver=virtualbox
		echo "Exiling cluster to sgoinfre..."
		mv ~/.minikube $SGOINFRE_PATH/.minikube
		ln -s $SGOINFRE_PATH/.minikube ~/.minikube
		minikube status &> /dev/null
		ft_error Cluster
	fi
	echo "Pointing Docker CLI to Minikube Docker Daemon..."
	eval $(minikube -p minikube docker-env)
}

function setup_metallb()
{
	kubectl apply -f https://raw.githubusercontent.com/metallb/metallb/v0.9.5/manifests/namespace.yaml
	kubectl apply -f https://raw.githubusercontent.com/metallb/metallb/v0.9.5/manifests/metallb.yaml
	kubectl create secret generic -n metallb-system memberlist --from-literal=secretkey="$(openssl rand -base64 128)"
	kubectl apply -f ./srcs/kubernetes/metallb-config.yaml
}

function build_images()
{
	echo "Building nginx container..."
	docker build -t nginx:latest ./srcs/nginx/
	echo "Building ftps container..."
	docker build -t ftps:latest ./srcs/ftps/
	echo "Building mysql container..."
	docker build -t mysql:latest ./srcs/mysql/
	echo "Building phpMyAdmin container..."
	docker build -t phpmyadmin:latest ./srcs/phpmyadmin/
	echo "Building wordpress container..."
	docker build -t wordpress:latest ./srcs/wordpress/
	echo "Building influxdb container..."
	docker build -t influxdb:latest ./srcs/influxdb/
	echo "Building grafana container..."
	docker build -t grafana:latest ./srcs/grafana/
}

function launch_services()
{
	kubectl apply -f ./srcs/kubernetes/ssl_secret.yaml
	kubectl apply -f ./srcs/kubernetes/ssh_secret.yaml
	kubectl apply -f ./srcs/kubernetes/ftps_secret.yaml
	kubectl apply -f ./srcs/kubernetes/mysql_secret.yaml
	kubectl apply -f ./srcs/ftps.yaml
	kubectl apply -f ./srcs/mysql.yaml
	kubectl apply -f ./srcs/phpmyadmin.yaml
	kubectl apply -f ./srcs/wordpress.yaml
	kubectl apply -f ./srcs/nginx.yaml
	kubectl apply -f ./srcs/influxdb.yaml
	kubectl apply -f ./srcs/grafana.yaml
}

hostname | grep 42madrid &> /dev/null
if [ $? != 0 ]
then
	printf $RED"You don't seem to be on the Madrid 42 campus...\nSorry, can't install.\n"$RESET
	exit 1
fi
setup_sgoinfre
setup_docker
setup_virtualbox
setup_brew
setup_kubectl
setup_minikube
launch_minikube
setup_metallb
build_images
launch_services
yes | docker system prune