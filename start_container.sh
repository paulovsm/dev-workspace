#!/bin/bash

function finish {
        sudo docker stop my-weblogic
}
trap finish EXIT

if [[ "$(sudo docker images -q paulovsm/weblogic 2> /dev/null)" == "" ]]; then
	sudo docker pull paulovsm/weblogic
	
	sudo docker run --name my-weblogic -e WEBLOGIC_PASSWD=weblogic123 -e DOMAIN_DIR=/weblogic/domains -e DOMAIN_NAME=mydomain -e SERVER_START_MODE=dev -p 7001:7001 -p 7002:7002 -ti -v $PWD/teste:/weblogic/wls12130 paulovsm/weblogic
else
	sudo docker start my-weblogic
fi

