#!/bin/bash
RESULTADO=$(curl http://ipservidor:puerto/api/v1.1/consulta/estado) # configurar api correspondiente a su banco y reemplazar

echo $RESULTADO

if [[ $RESULTADO == *"Abierto"* ]]; then
  echo 'check_bcra{target="http://ipservidor:puerto/api/v1.1/consulta/estado"} 1' > /home/vsupport/monitoreo-grafana/textfile-collector/check_bcra.prom
else
  echo 'check_bcra{target="http://ipservidor:puerto/api/v1.1/consulta/estado"} 0' > /home/vsupport/monitoreo-grafana/textfile-collector/check_bcra.prom
fi
