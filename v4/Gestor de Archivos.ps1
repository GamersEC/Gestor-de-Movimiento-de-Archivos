# Verificar si el módulo BurntToast está instalado
if (-not (Get-Module -ListAvailable -Name BurntToast)) {
    # Instalar el módulo BurntToast
    Install-Module -Name BurntToast -Scope CurrentUser -Force
}

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

    # Mostrar notificación de configuración exitosa con un icono relativo
    $iconoRelativo = Join-Path -Path $scriptDirectory -ChildPath "recursos\Icono-1.ico"
    New-BurntToastNotification -AppLogo $iconoRelativo -Text "- Configuracion guardada correctamente", "- La carpeta de logs se creo correctamente"
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
$nombreLog = "Registro_$(Get-Date -Format 'dd-MM-yyyy_HH-mm-').log"
$rutaLog = Join-Path -Path $carpetaLog -ChildPath $nombreLog

# Registrar el resultado en el archivo de registro
$mensajeLog = "Archivos movidos correctamente: $ArchivosMovidos`r`nArchivos con errores: $ErroresMovimiento`r`nArchivos con errores: $($ArchivosConErrores -join ', ')"
$mensajeLog | Out-File -FilePath $rutaLog -Append

# Notificación final
if ($ErroresMovimiento -eq 0) {
    New-BurntToastNotification -AppLogo $iconoRelativo -Text "Proceso completado", "Archivos movidos correctamente."
} else {
    New-BurntToastNotification -AppLogo $iconoRelativo -Text "Proceso con errores", "Algunos archivos tuvieron errores al moverlos. Revise el registro para tener mas informacion"
}