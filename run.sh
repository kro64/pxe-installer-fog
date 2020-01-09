#!/bin/bash

NAME=fog-pxe-server
URL="https://github.com/FOGProject/fogproject/archive/1.5.7.tar.gz"

docker ps | grep $NAME

if [ "$?" == 0 ]; then
	echo "A container is already running. Exiting"
	exit 2
fi

#Launch the container
docker run -idt --rm --name $NAME fog-pxe

docker exec -it $NAME /bin/bash -c "cd ~ && wget $URL"


