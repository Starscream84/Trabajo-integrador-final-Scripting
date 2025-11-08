#!/bin/bash
# limpiar.sh
# Limpia archivos temporales del sistema y del usuario en Linux

# -------------
# CONFIGURACIÓN
# -------------
LOG_FILE="$HOME/limpieza_sistema.log"
DATE=$(date "+%Y-%m-%d %H:%M:%S")

echo -e "\e[1;33m======= LIMPIEZA DE ARCHIVOS TEMPORALES =======\e[0m" | tee "$LOG_FILE"
echo "Fecha: $DATE" | tee -a "$LOG_FILE"
echo "" | tee -a "$LOG_FILE"

# ---------------------------
# LIMPIEZA DE /tmp Y /var/tmp
# ---------------------------
echo -e "\e[1;34m→ Limpiando carpetas temporales del sistema...\e[0m" | tee -a "$LOG_FILE"

# Elimina contenido temporal del sistema
sudo rm -rf /tmp/* /var/tmp/* 2>/dev/null

echo "[OK] Carpetas /tmp y /var/tmp limpiadas." | tee -a "$LOG_FILE"
echo "" | tee -a "$LOG_FILE"

# ----------------------------
# LIMPIEZA DE CACHÉ DE USUARIO
# ----------------------------
echo -e "\e[1;34m→ Limpiando cachés del usuario...\e[0m" | tee -a "$LOG_FILE"

if [ -d "$HOME/.cache" ]; then
  rm -rf "$HOME/.cache/"* 2>/dev/null
  echo "[OK] Caches de usuario eliminadas." | tee -a "$LOG_FILE"
else
  echo "[INFO] No se encontró carpeta de caché en el usuario actual." | tee -a "$LOG_FILE"
fi

echo "" | tee -a "$LOG_FILE"

# -----------------------------------------
# LIMPIEZA DE ARCHIVOS TEMPORALES GENERALES
# -----------------------------------------
echo -e "\e[1;34m→ Eliminando archivos temporales de usuario (*.tmp, *.bak, *.log)...\e[0m" | tee -a "$LOG_FILE"

find "$HOME" -type f \( -name "*.tmp" -o -name "*.bak" -o -name "*.log" \) -delete 2>/dev/null
echo "[OK] Archivos temporales eliminados del directorio personal." | tee -a "$LOG_FILE"

echo "" | tee -a "$LOG_FILE"

# ------------------------------
#  FINALIZACIÓN
# ------------------------------
echo -e "\e[1;32m✔ Limpieza completada correctamente.\e[0m" | tee -a "$LOG_FILE"
echo "Informe guardado en: $LOG_FILE" | tee -a "$LOG_FILE"
sleep 2
