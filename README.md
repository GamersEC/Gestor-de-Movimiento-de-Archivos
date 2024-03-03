__Gestor de Movimiento de Archivos__

Este es un script de PowerShell que te permite mover archivos entre rutas especificadas y gestionar la creación de registros. Puedes usarlo para automatizar el proceso de mover archivos y mantener un registro de las operaciones realizadas.



__Características__


Configuración inicial:
El script te guiará a través de la configuración inicial, donde podrás especificar las rutas de origen y destino, así como la carpeta de logs.

Movimiento de archivos:
El script buscará archivos en la ruta de origen y los moverá a la ruta de destino, excluyendo aquellos que contengan “1005.5” en su nombre.

Registro de operaciones:
Se creará un archivo de registro en la carpeta de logs para registrar los archivos movidos correctamente y los errores encontrados.
Notificaciones: Se mostrarán notificaciones con un icono relativo al script para informarte sobre el estado del proceso.



__Guía de Instalación__



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
