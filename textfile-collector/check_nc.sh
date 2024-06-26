#!/bin/bash

DIR=/opt/accusys/monitoreo-grafana/textfile-collector/check_nc.prom
IP=192.168.172.57
PORT=1433

nc -z -w 2 $IP $PORT > /dev/null #Configurar ip y puerto correspondiente a su BD

if [ $? -eq 0 ]; then
  echo "check_nc{target=\"$IP\"} 1" > $DIR
else
  echo "check_nc{target=\"$IP\"} 0" > $DIR
fi
