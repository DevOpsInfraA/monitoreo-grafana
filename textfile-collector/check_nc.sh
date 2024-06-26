#!/bin/bash

DIR=/opt/accusys/monitoreo-grafana/textfile-collector/check_nc.prom
nc -z -w 2 192.168.172.57 1433 > /dev/null #Configurar ip y puerto correspondiente a su BD

if [ $? -eq 0 ]; then
  echo "check_nc{target=\"192.168.172.71\"} 1" > $DIR
else
  echo "check_nc{target=\"192.168.172.71\"} 0" > $DIR
fi
