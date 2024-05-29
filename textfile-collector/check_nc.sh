#!/bin/bash
nc -z -w 2 xxxxxxx xxxx > /dev/null #Configurar ip y puerto correspondiente a su BD

if [ $? -eq 0 ]; then
  echo "check_nc{target=\"xxxxxxxx\"} 1" > /opt/accusys/monitoreo-grafana/textfile-collector/check_nc.prom
else
  echo "check_nc{target=\"xxxxxxxx\"} 0" > /opt/accusys/monitoreo-grafana/textfile-collector/check_nc.prom
fi
