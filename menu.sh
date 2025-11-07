#!/bin/bash

while true; do
	clear
	echo -e "\e[1;34m===== MENÚ PRINCIPAL =====\e[0m"
	echo "1. Realizar Backup"
	echo "2. Generar informe del sistema"
	echo "3. Limpiar archivos temporales"
	echo "4. Salir" 
	read -p "Seleccione una opcion: " opcion

	case $opcion in
		1) bash backup.sh ;;
		2) bash informe.sh ;;
		3) bash limpiar.sh ;;
		4) echo "Saliendo..." break;;
		*) echo "Opcion no válida"; sleep 2;;
	esac
done
