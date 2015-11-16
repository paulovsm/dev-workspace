#!/bin/bash

function finish {
        sudo docker stop my-weblogic
}
trap finish EXIT

if [[ "$(sudo docker images -q paulovsm/weblogic 2> /dev/null)" == "" ]]; then
	sudo docker pull paulovsm/weblogic
	
	sudo docker rm my-weblogic && sudo docker run --name my-weblogic -e WEBLOGIC_PASSWD=weblogic123 -e DOMAIN_DIR=/weblogic/domains -e DOMAIN_NAME=blodes_domain -e SERVER_START_MODE=dev -p 7001:7001 -p 7002:7002 -p 8453:8453 -e "debugFlag=true" -e "EXTRA_JAVA_PROPERTIES=-Duser.timezone='-03:00'" -ti -v /c/Users/Public/wls_servers/spm:/weblogic/wls12130 paulovsm/weblogic  
else
	sudo docker start my-weblogic
fi

