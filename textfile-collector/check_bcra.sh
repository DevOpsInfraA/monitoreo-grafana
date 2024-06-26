#!/bin/bash

DIR=/opt/accusys/monitoreo-grafana/textfile-collector/check_bcra.prom

RESULTADO=$(curl http://ipservidor:puerto/api/v1.1/consulta/estado) # configurar api correspondiente a su banco y reemplazar

echo $RESULTADO

if [[ $RESULTADO == *"Abierto"* ]]; then
  echo 'check_bcra{target="http://ipservidor:puerto/api/v1.1/consulta/estado"} 1' > $DIR
else
  echo 'check_bcra{target="http://ipservidor:puerto/api/v1.1/consulta/estado"} 0' > $DIR
fi
