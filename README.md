**Gestor de Movimiento de Archivos**

Este es un script de PowerShell que te permite mover archivos entre rutas especificadas y gestionar la creación de registros. Puedes usarlo para automatizar el proceso de mover archivos y mantener un registro de las operaciones realizadas.


**Características**


**Configuración inicial**

El script te guiará a través de la configuración inicial, donde podrás especificar las rutas de origen y destino, así como la carpeta de logs.

**Movimiento de archivos**

El script buscará archivos en la ruta de origen y los moverá a la ruta de destino, excluyendo aquellos que contengan “1005.5” en su nombre.

**Registro de operaciones**

Se creará un archivo de registro en la carpeta de logs para registrar los archivos movidos correctamente y los errores encontrados.

**Notificaciones**

Se mostrarán notificaciones con un icono relativo al script para informarte sobre el estado del proceso.


**Uso**

- Ejecuta el script en PowerShell.
- Sigue las instrucciones para configurar las rutas de origen y destino.
- El script moverá los archivos y generará un archivo de registro.


**Requisitos**

PowerShell instalado en tu sistema.


**Icono**

El icono utilizado para las notificaciones se encuentra en la carpeta recursos. Puedes personalizarlo reemplazando el archivo Icono-1.ico por otro de tu elección.

**Notas**

Asegúrate de tener permisos suficientes para mover archivos en las rutas especificadas.
Si encuentras errores, revisa el archivo de registro para obtener más detalles.
