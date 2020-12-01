#!/bin/bash

TONTI=0
if [ $# == 0 ] || [ "$1" == "--help" ] || [ "$1" == "-h" ]
then
	echo "fulmina_service <service>"
	echo "Pass the name of the k8s service you want to destroy as the sole argument."
	echo "This script will destroy the service and any deployments as well as associated docker containers and images."
	exit 1
elif [ $# != 1 ]
then
	echo "Too many arguments. Supply a single argument only."
	echo "Supply one argument"
	exit 1
else
	kubectl get pods | grep -o $1
	if [ $? != 0 ]
	then
		echo "Pod not found. Aborting."
		exit 1
	fi
fi
kubectl delete deploy $1
kubectl delete svc $1
echo "Waiting for $1 deployments to terminate..."
while [ $TONTI == 0 ]
do
	sleep 5
	kubectl get pods | grep -o $1 &> /dev/null
	if [ $? != 0 ]
	then
		TONTI=1
	fi
done
docker images | grep -o k8s &> /dev/null
if [ $? != 0 ]
then
	eval $(minikube -p minikube docker-env)
	echo "Docker linked to minikube docker daemon"
fi
docker rm $1
docker rmi $1
echo "Deleted $1 deployments and service, removed $1 docker containers and images."
docker build -t $1:latest /Users/mrosario/ft_services/srcs/$1/
echo "Rebuilt image"
kubectl apply -f /Users/mrosario/ft_services/srcs/$1.yaml
echo "Restarted service"