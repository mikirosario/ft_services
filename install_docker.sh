#! bin/bash

#link docker

GOINFRE_PATH="/goinfre/$USER/docker"

rm -rf ~/Library/Containers/com.docker.docker ~/.docker
mkdir -p $GOINFRE_PATH/{com.docker.docker,.docker}
ln -sf $GOINFRE_PATH/com.docker.docker ~/Library/Containers/com.docker.docker
ln -sf $GOINFRE_PATH/.docker ~/.docker