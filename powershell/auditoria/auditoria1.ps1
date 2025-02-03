# Ruta del archivo de registro general
$LogFile = "C:\Users\Administrador.WIN-GS9465L7VI7\Desktop\registros_ve\registros_ve_completo.log.txt"

# Create a timestamped daily log file name when the script starts
$currentDateTime = Get-Date -Format "yyyy-MM-dd_HHmmss"
$DailyLogFile = "C:\Users\Administrador.WIN-GS9465L7VI7\Desktop\registros_ve\registros_ve_$currentDateTime.log.txt"

# Variables to keep track of the last logged event
$lastLoggedUser = $null
$lastLoggedTimestamp = $null

# Función para registrar el inicio de sesión del usuario
function Register-Login {
    param (
        [string]$User,
        [DateTime]$Timestamp
    )

    # Filter out users containing the '$' character
    if ($User -notmatch '\$') {
        # Check for duplicate within the same minute
        if ($User -ne $lastLoggedUser -or ($Timestamp - $lastLoggedTimestamp).TotalMinutes -gt 1) {
            "$Timestamp - $User" | Out-File -Append -FilePath $LogFile -ErrorAction Stop

            # Log only for the current day
            $currentDate = Get-Date -Format "yyyy-MM-dd"
            if ($Timestamp.ToString("yyyy-MM-dd") -eq $currentDate) {
                "$Timestamp - $User" | Out-File -Append -FilePath $DailyLogFile -ErrorAction Stop
            }

            # Update last logged event
            $global:lastLoggedUser = $User
            $global:lastLoggedTimestamp = $Timestamp
        }
    }
}

# Comprobar si los archivos de registro existen, si no, crearlos
if (-not (Test-Path -Path $LogFile)) {
    New-Item -Path $LogFile -ItemType File -ErrorAction Stop
}

Write-Host "Creando registros..."

# Set the start of today
$today = Get-Date -Format "yyyy-MM-dd"
$startOfToday = [datetime]::ParseExact($today, "yyyy-MM-dd", $null)

# Fetch login events for today
$events = Get-WinEvent -LogName Security -FilterXPath "*[System/EventID=4624 and System/TimeCreated[@SystemTime >= '$($startOfToday.ToString("o"))']]"

foreach ($event in $events) {
    $User = $event.Properties[5].Value
    $Timestamp = $event.TimeCreated
    try {
        # Check if the user is not SYSTEM before logging
        if ($User -notlike "*SYSTEM*") {
            # Register the user login
            Register-Login $User $Timestamp
        }
    }
    catch {
        Write-Error "Failed to write to log file: $_"
    }
}


Write-Host "Registros creados correctamente!"