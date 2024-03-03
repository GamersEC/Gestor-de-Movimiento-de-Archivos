__Guía de Instalación del Gestor de Movimiento de Archivos__


¡Bienvenido! Aquí tienes una guía paso a paso para descargar e instalar el script “Gestor de Movimiento de Archivos” en tu computadora:


__Requisitos Previos__

Asegúrate de tener PowerShell instalado en tu sistema. Si no lo tienes, puedes descargarlo desde el sitio oficial de Microsoft.


__Descarga e Instalación__

Clonar el Repositorio:

- Abre tu navegador web y ve al repositorio de GitHub.
- Haz clic en el botón “Code” y selecciona “Download ZIP”.
- Descomprime el archivo ZIP en una ubicación de tu elección.


Ejecutar el Script:
- Abre PowerShell en tu computadora.
- Navega a la carpeta donde descomprimiste el archivo ZIP.
- Ejecuta el script con el siguiente comando:
- .\Gestor de Archivos.ps1

Configuración Inicial:

- El script te guiará a través de la configuración inicial. Ingresa las rutas de origen y destino cuando se te solicite.
- Se creará una carpeta de logs dentro del directorio actual.

Ejecución en Segundo Plano (opcional):
Si deseas ejecutar el script en segundo plano, considera utilizar Jobs de PowerShell o programar una tarea con el Programador de tareas de Windows.


__Icono Personalizado__

El icono utilizado para las notificaciones se encuentra en la carpeta recursos. Puedes personalizarlo reemplazando el archivo Icono-1.ico por otro de tu elección.


__Notas__
Asegúrate de tener permisos suficientes para mover archivos en las rutas especificadas.
Si encuentras errores, revisa el archivo de registro para obtener más detalles.


__Versiones__

El “Gestor de Movimiento de Archivos” se encuentra en constante desarrollo y mejora. A continuación, se detallan las versiones disponibles:

__Versión 1.0.0 (Lanzamiento Inicial)__

- Configuración inicial de rutas de origen y destino.
- Movimiento de archivos entre las rutas especificadas.
- Creación de un archivo de registro para registrar las operaciones.


__Versión 1.1.0__
- Agregada notificación de configuración exitosa con icono personalizado.
- Corrección de errores menores.
