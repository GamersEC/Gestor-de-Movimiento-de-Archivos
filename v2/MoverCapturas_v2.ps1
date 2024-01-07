# Solicitar la ubicación de la carpeta de origen y destino la primera vez que se ejecuta
if (-not $script:Configurado) {
    $script:Configurado = $true

    $origen = Read-Host "Ingrese la ruta de la carpeta de origen"
    $destino = Read-Host "Ingrese la ruta de la carpeta de destino"

    # Preguntar cada cuántas horas se ejecutará el script
    do {
        $intervaloHoras = Read-Host "Ingrese cada cuántas horas desea que se ejecute el script"
    } while (-not $intervaloHoras -or $intervaloHoras -le 0 -or $intervaloHoras -notmatch '^\d+$')

    # Crear la tarea programada para ejecutar el script cada x horas
    $trigger = New-ScheduledTaskTrigger -AtStartup
    $trigger.Repetition.Interval = "PT${intervaloHoras}H"

    $action = New-ScheduledTaskAction -Execute "powershell.exe" -Argument "-NoProfile -ExecutionPolicy Bypass -File `"$PSScriptRoot\script.ps1`""

    Register-ScheduledTask -Action $action -Trigger $trigger -TaskName "EjecutarScript" -Force
}

# Notificación de inicio del script
if (Get-Command "New-BurntToastNotification" -ErrorAction SilentlyContinue) {
    New-BurntToastNotification -Text "El script se está ejecutando al iniciar el PC." -AppLogo Recurso-1.ico
} else {
    Write-Host "Para mostrar la notificación, instala el módulo BurntToast."
}

# Verificar si hay archivos en la carpeta de origen
if (!(Test-Path $origen) -or !(Get-ChildItem $origen)) {
    # Mostrar notificación en Windows de que no hay archivos para mover
    if (Get-Command "New-BurntToastNotification" -ErrorAction SilentlyContinue) {
        New-BurntToastNotification -Text "No se pueden mover archivos de la carpeta de origen porque se encuentra vacía." -AppLogo Recurso-1.ico
    } else {
        Write-Host "Para mostrar la notificación, instala el módulo BurntToast."
    }
    exit
}

# Verificar si la carpeta de destino existe, si no, crearla
if (-not (Test-Path $destino)) {
    New-Item -ItemType Directory -Force -Path $destino
}

# Obtener la lista de archivos en la carpeta de origen
$archivos = Get-ChildItem $origen

# Mover cada archivo al destino en segundo plano
foreach ($archivo in $archivos) {
    try {
        Move-Item $archivo.FullName $destino -ErrorAction Stop
    } catch {
        # Notificación en caso de error
        if (Get-Command "New-BurntToastNotification" -ErrorAction SilentlyContinue) {
            New-BurntToastNotification -Text "Error al mover archivos: $_" -AppLogo Recurso-1.ico
        } else {
            Write-Host "Para mostrar la notificación, instala el módulo BurntToast."
        }
        exit
    }
}

Write-Host "La transferencia se ha realizado con éxito en segundo plano."

# Opcional: Crear de nuevo la carpeta de origen (comentar la línea siguiente si no se desea recrear)
New-Item -ItemType Directory -Force -Path $origen

# Mostrar notificación en Windows
if (Get-Command "New-BurntToastNotification" -ErrorAction SilentlyContinue) {
    New-BurntToastNotification -Text "Las Capturas de Xbox se han movido a otra ubicación para liberar espacio." -AppLogo Recurso-1.ico
} else {
    Write-Host "Para mostrar la notificación, instala el módulo BurntToast."
}
