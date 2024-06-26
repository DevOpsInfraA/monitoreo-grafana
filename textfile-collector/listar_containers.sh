#!/bin/bash

DIR_LIST=/opt/accusys/monitoreo-grafana/textfile-collector/listar_containers.prom
if [ -f $DIR_LIST ]; then
   rm $DIR_LIST
else
   touch $DIR_LIST
fi

CONTAINER_NAMES=$(docker ps -a --format '{{.Names}}')


for CONTAINER_NAME in $CONTAINER_NAMES; do
	CONTAINER_STATUS=$(docker inspect --format='{{.State.Status}}' $CONTAINER_NAME)
	if [[ $CONTAINER_STATUS == "running" ]]; then
		echo "docker_status{container=\"$CONTAINER_NAME\"} 1" >> $DIR_LIST
	else
		echo "docker_status{container=\"$CONTAINER_NAME\"} 0" >> $DIR_LIST
	fi
	
done
