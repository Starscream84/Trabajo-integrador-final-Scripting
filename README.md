![Scripting](resources/script.jpg)

# Automatización de Tareas del Sistema Operativo

Este proyecto forma parte del **TIF de la materia Sistemas Operativos**.  
Consiste en un conjunto de scripts Bash que automatizan tareas básicas del sistema Linux.

## Estructura del proyecto 
- menu.sh  — Menú principal
- backup.sh — Backup + retención
- informe.sh — Genera informe del sistema
- limpiar.sh — Limpieza de temporales
- config.cfg — Parámetros configurables
- memoria_tecnica.md — Memoria técnica

## Funcionalidades 
Backup:
- Carga la configuracion desde config.cfg
- Crea las carpetas necesarias
- Genera un backup comprimido con sello de fecha/hora
- Guarda un registro del proceso
- Borra los registros mas viejos

Informe:
- Crea o actualiza un archivo de log del sistema
- Registra la fecha actual
- Obtiene y muestra informacion del CPU, memoria y disco
- Guarda todo en un archivo.log

Limpiar:
 - Regista la fecha y crea un log de limpieza
 - Borra los archivos temporales del sistema
 - Limpia las caches del usuario
 - Elimina archivos temporales
 - Deja constancia de todo el proceso un archivo.log

## Requisitos
- Bash (recomendado Bash 4+ aunque funciona en Bash 3.x en macOS)

![Bash](resources/bash.jpg)

### Ejecucion
---
Ejecturar el menu principal en el terminal

```bash
bash menu.sh
```

### Configuracion Backup
---
- Abri el archivo config.cfg para modificar la ruta del directorio.

- Cambiá esta ruta ("Users/....") por la carpeta real que contiene tu proyecto o archivos importantes a realizar el backup

``` bash
SRC_DIR="/Users/matias/Trabajo-integrador-final-Scripting/scripts"
```

### Colaboraciones
---
Consejos si te interesa colaborar con el proyecto:
- Puedes hacer un Fork del repositorio.
- Describe los cambios y porque deberian integrarse al proyecto.
- Manten tus commits pequeños y claros.
- Sigue el estilo de codigo del proyecto.
- El equipo revisara tu Pull Request y podra pedir modificaciones.