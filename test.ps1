# Ruta de origen
$origen = "C:\Users\marcu\Videos\Captures"

# Verificar si hay archivos en la carpeta de origen
if (!(Test-Path $origen) -or !(Get-ChildItem $origen)) {
    # Mostrar notificación en Windows de que no hay archivos para mover
    if (Get-Command "New-BurntToastNotification" -ErrorAction SilentlyContinue) {
        New-BurntToastNotification -Text "No se pueden mover archivos de la carpeta de origen porque se encuentra vacía." -AppLogo E:\Windows\Recurso-1.ico
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

# Mover cada archivo al destino en segundo plano
foreach ($archivo in $archivos) {
    Start-Process powershell.exe -ArgumentList "-NoProfile -ExecutionPolicy Bypass -File `"$PSScriptRoot\script.ps1`"" -NoNewWindow -PassThru
}

Write-Host "La transferencia se ha iniciado en segundo plano."

# Opcional: Crear de nuevo la carpeta de origen (comentar la línea siguiente si no se desea recrear)
New-Item -ItemType Directory -Force -Path $origen

# Mostrar notificación en Windows
if (Get-Command "New-BurntToastNotification" -ErrorAction SilentlyContinue) {
    New-BurntToastNotification -Text "Las Capturas de Xbox se han movido a otra ubicación para liberar espacio." -AppLogo E:\Windows\Recurso-1.ico
} else {
    Write-Host "Para mostrar la notificación, instala el módulo BurntToast."
}