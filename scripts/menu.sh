#!/bin/bash

while true; do
	clear
	echo -e "\e[1;34m ------------------------------\e[0m"
	echo -e "\e[1;34m        MENÚ PRINCIPAL         \e[0m"
	echo -e "\e[1;34m ------------------------------\e[0m"
	echo -e " 1. Realizar Backup"
	echo -e " 2. Generar informe del sistema"
	echo -e " 3. Limpiar archivos temporales"
	echo -e " 4. Salir"
	echo -e " \e[1;34m ------------------------------\e[0m"

	read -p " Seleccione una opcion: " opcion


	case $opcion in
		1) bash backup.sh
		echo ""
		echo -e "\e[1;32m Backup completado correctamente.\e[0m"
		echo ""
		read -p "Presione Enter para volver al menú..."
		;;

		2) bash informe.sh
		echo ""
		echo -e "\e[1;32m Informe generado exitosamente.\e[0m"
		echo ""
                read -p "Presione Enter para volver al menú..."
		;;

		3) bash limpiar.sh
		echo ""
		echo -e "\e[1;32m Limpieza completada con exito.\e[0m"
                read -p "Presione Enter para volver al menú..."
		;;
		4) echo -e "\e[1;33m Saliendo...\e[0m"; sleep 2; break;;
		*) echo -e "\e[1;31m Opcion no válida. Intente nuevamente.\e[0m"; sleep 2;;
	esac
done
