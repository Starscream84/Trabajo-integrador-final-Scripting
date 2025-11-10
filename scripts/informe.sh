

#!/bin/bash
# informe.sh
# Genera un informe de CPU, memoria y disco (muestra y guarda en log)

# Guarda el informe en un archivo dentro del directorio personal del usuario
log="$HOME/informe_sistema.log"
echo -e "\e[1;34m======= INFORME DEL SISTEMA =======\e[0m" | tee "$log"

date | tee -a "$log"

echo "" | tee -a "$log"
echo "Uso de CPU:" | tee -a "$log"

# Verifica que comando esta disponible en sistema
if command -v top &>/dev/null; then
  top -bn1 | grep "Cpu(s)" | tee -a "$log"
elif command -v wmic &>/dev/null; then
  wmic cpu get loadpercentage | tee -a "$log"
else
  echo "No se pudo obtener la información de CPU" | tee -a "$log"
fi

echo "" | tee -a "$log"
echo "Uso de memoria:" | tee -a "$log"

# Muestra la memoria usada y libre
if command -v free &>/dev/null; then
  free -h | tee -a "$log"
elif command -v wmic &>/dev/null; then
  wmic OS get FreePhysicalMemory,TotalVisibleMemorySize /Value | tee -a "$log"
else
  echo "No se pudo obtener la información de memoria" | tee -a "$log"
fi

#Muestra espacio en disco
echo "" | tee -a "$log"
echo "Espacio en disco:" | tee -a "$log"
df -h | tee -a "$log"

#Mensaje final
echo "" | tee -a "$log"
echo "Informe guardado en: $log" | tee -a "$log"
sleep 2

