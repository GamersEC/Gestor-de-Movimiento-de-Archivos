# Creado por: Marcus Mayorga

<#
Este Script se usa para mover las capturas de la apliacion de Xbox del almacenamiento principal a otra
ubicacion en caso de no querer usar OneDrive o el disco principal
#>

# Ruta de origen
$origen = "C:\Users\marcu\Videos\Captures"

# Verificar si hay archivos en la carpeta de origen
if (!(Test-Path $origen) -or !(Get-ChildItem $origen)) {
    # Mostrar notificación en Windows de que no hay archivos para mover
    if (Get-Command "New-BurntToastNotification" -ErrorAction SilentlyContinue) {
        New-BurntToastNotification -Text "No se pueden mover archivos de la carpeta de origen porque se encuentra vacia." -AppLogo E:\Windows\Recurso-1.ico
    } else {
        Write-Host "Para mostrar la notificación, instala el módulo BurntToast."
    }
    exit
}

# Ruta de destino
$destino = "D:\Capturas Xbox"

# Verificar si la carpeta de destino existe, si no, crearla
if (-not (Test-Path $destino)) {
    New-Item -ItemType Directory -Force -Path $destino
}

# Obtener la lista de archivos en la carpeta de origen
$archivos = Get-ChildItem $origen

# Mover cada archivo al destino
foreach ($archivo in $archivos) {
    Move-Item $archivo.FullName -Destination $destino -Force
}

Write-Host "La transferencia se ha completado correctamente."

# Opcional: Crear de nuevo la carpeta de origen (comentar la línea siguiente si no se desea recrear)
New-Item -ItemType Directory -Force -Path $origen

# Mostrar notificación en Windows
if (Get-Command "New-BurntToastNotification" -ErrorAction SilentlyContinue) {
    New-BurntToastNotification -Text "Las Capturas de Xbox se han movido a otra ubicacion para liberar espacio." -AppLogo E:\Windows\Recurso-1.ico
} else {
    Write-Host "Para mostrar la notificación, instala el módulo BurntToast."
}