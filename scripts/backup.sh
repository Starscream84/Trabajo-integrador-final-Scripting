#!/bin/bash
#8 Hace que el script se detenga si ocurre un error
set -euo pipefail

#8 Carga la ruta donde esta el script(SCRIPT_DIR)
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
source "$SCRIPT_DIR/config.cfg"
log_dir="$LOG_DIR"
mkdir -p "$BACKUP_DIR" "$log_dir"

#8 Crea carpetas de backup y log si no existen
DATE=$(date +%Y%m%d-%H%M%S) #8 Genera una cadena de texto con la fecha y hora actuales
BASENAME=$(basename "$SRC_DIR")
DEST="$BACKUP_DIR/${BASENAME}-$DATE.tar.gz"

#8 Muestra el mensaje inicial
echo "[INFO] Iniciando backup: $SRC_DIR -> $DEST"

if [ ! -d "$SRC_DIR" ]; then
	echo "[ERROR] Directorio origen no existe: $SRC_DIR"
	exit 1
fi

tar -czf "$DEST" -C "$(dirname "$SRC_DIR")" "$(basename "$SRC_DIR")"

echo "[INFO] Backup creado en: $DEST"
echo "$(date) - Backup creado: $DEST" >> "$log_dir/backup.log"

mapfile -t files < <(find "$BACKUP_DIR" -maxdepth 1 -type f -name "${BASENAME}-*.tar.gz" -printf '%T@ %p\n' 2>/dev/null | sort -rn | awk '{print $2}')

count=0
for f in "${files[@]}"; do
	((count++))
	if [ "$count" -gt "$RETENTION" ]; then
		echo "[INFO] Eliminando backup antiguo: $f"
		rm -f "$f"
		echo "$(date) - Eliminado: $f" >> "$log_dir/backup.log"
	fi
done


