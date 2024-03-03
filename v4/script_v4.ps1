# Importar el módulo BurntToast
Import-Module BurntToast

# Obtener la ruta del directorio actual del script
$scriptDirectory = $PSScriptRoot

# Verificar si es la primera ejecución
if (-not (Test-Path -Path "$scriptDirectory\config.txt")) {
    # Solicitar rutas al usuario
    $origen = Read-Host "Introduce la ruta de origen"
    $destino = Read-Host "Introduce la ruta de destino"

    # Crear la carpeta de logs dentro del directorio actual
    $carpetaLog = Join-Path -Path $scriptDirectory -ChildPath "Logs"
    New-Item -ItemType Directory -Force -Path $carpetaLog

    # Guardar las rutas en un archivo de configuración
    $configContent = "Origen=$origen`nDestino=$destino`nCarpetaLog=$carpetaLog"
    $configContent | Out-File -FilePath "$scriptDirectory\config.txt"
} else {
    # Leer las rutas desde el archivo de configuración
    $config = Get-Content -Path "$scriptDirectory\config.txt"
    $origen = ($config | Where-Object { $_ -like "Origen=*" }).Substring(7)
    $destino = ($config | Where-Object { $_ -like "Destino=*" }).Substring(8)
    $carpetaLog = ($config | Where-Object { $_ -like "CarpetaLog=*" }).Substring(10)
}

# Obtener todos los archivos en origen
$Ficherosamover = Get-ChildItem -Path $origen -File | Where-Object { $_.Name -notlike "*1005.5*" }

# Variables para el conteo de archivos movidos y errores
$ArchivosMovidos = 0
$ErroresMovimiento = 0
$ArchivosConErrores = @()

# Mover archivos
foreach ($Fichero in $Ficherosamover) {
    $RutaDestino = Join-Path -Path $destino -ChildPath $Fichero.Name

    try {
        Move-Item $Fichero.FullName $RutaDestino -ErrorAction Stop
        $ArchivosMovidos++
    } catch {
        $ErroresMovimiento++
        $ArchivosConErrores += $Fichero.Name
    }
}

# Crear la carpeta de logs dentro del directorio actual
$carpetaLog = Join-Path -Path $scriptDirectory -ChildPath "Logs"
New-Item -ItemType Directory -Force -Path $carpetaLog

# Crear un archivo de registro en la ruta especificada
$nombreLog = "MovimientoArchivos_$(Get-Date -Format 'yyyyMMdd_HHmmss').log"
$rutaLog = Join-Path -Path $carpetaLog -ChildPath $nombreLog

# Registrar el resultado en el archivo de registro
$mensajeLog = "Archivos movidos correctamente: $ArchivosMovidos`r`nArchivos con errores: $ErroresMovimiento`r`nArchivos con errores: $($ArchivosConErrores -join ', ')"
$mensajeLog | Out-File -FilePath $rutaLog -Append

# Notificación final
if ($ErroresMovimiento -eq 0) {
    New-BurntToastNotification -Text "Archivos movidos correctamente. Registro guardado en $rutaLog"
} else {
    New-BurntToastNotification -Text "Algunos archivos tuvieron errores al moverlos. Registro guardado en $rutaLog"
}