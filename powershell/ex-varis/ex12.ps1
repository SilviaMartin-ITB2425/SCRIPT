#Autor: Silvia Martín
#03/02/2025
<#
Realitzar un script final que farà una còpia de seguretat d’una carpeta que es passi per paràmetre.
#>
# Comprovem que s'han passat els dos paràmetres necessaris
# El primer paràmetre serà el directori a fer la còpia de seguretat
# El segon paràmetre serà el directori de destinació on es desarà el fitxer ZIP
if ($args.Length -ne 2) {
    Write-Output "Error: Cal passar dos paràmetres: 1) Directori a fer la còpia, 2) Directori de destinació."
    exit  # Surt de l'script si no es passen els paràmetres correctes
}

# Assignem els paràmetres a variables
$directoriOrigen = $args[0]  # Directori a fer la còpia de seguretat
$directoriDesti = $args[1]   # Directori on es desarà la còpia de seguretat

# Comprovem si el directori origen existeix
# Utilitzem Test-Path per comprovar si el directori d'origen existeix en el sistema
if (-not (Test-Path -Path $directoriOrigen -PathType Container)) {
    Write-Output "Error 1: El directori '$directoriOrigen' no existeix."
    exit  # Surt de l'script si el directori d'origen no existeix
}

# Creem el nom del fitxer de la còpia de seguretat
# El nom del fitxer serà del format: backup_nom_directori_YYYYMMDD.zip
# Obtenim el nom de la carpeta d'origen (nom sense la ruta completa)
$nomDirectori = (Get-Item -Path $directoriOrigen).Name  # Obtenim el nom de la carpeta d'origen
# Obtenim la data actual en format YYYYMMDD
$dataActual = Get-Date -Format "yyyyMMdd"
# Generem el nom final del fitxer ZIP
$nomFitxerBackup = "backup_${nomDirectori}_${dataActual}.zip"

# Comprovem si el fitxer de còpia ja existeix al directori de destinació
# Utilitzem Join-Path per crear el camí complet del fitxer ZIP dins del directori de destinació
$fitxerBackupPath = Join-Path -Path $directoriDesti -ChildPath $nomFitxerBackup
# Comprovem si aquest fitxer ja existeix
if (Test-Path -Path $fitxerBackupPath) {
    Write-Output "Error 2: Ja existeix un fitxer amb el nom '$nomFitxerBackup'."
    exit  # Surt de l'script si el fitxer ja existeix al directori de destinació
}

# Comprovem si el directori de destinació existeix
# Si el directori de destinació no existeix, el script mostra un missatge d'error
if (-not (Test-Path -Path $directoriDesti -PathType Container)) {
    Write-Output "Error: El directori de destinació '$directoriDesti' no existeix."
    exit  # Surt de l'script si el directori de destinació no existeix
}

# Fem la còpia de seguretat i la comprimim en un fitxer ZIP
# Utilitzem Compress-Archive per empaquetar el directori d'origen en un arxiu ZIP
Write-Output "Fent còpia de seguretat de '$directoriOrigen' a '$fitxerBackupPath'..."
Compress-Archive -Path $directoriOrigen -DestinationPath $fitxerBackupPath

# Missatge informatiu en finalitzar
# Un cop la còpia de seguretat s'ha fet amb èxit, mostrem un missatge de confirmació
Write-Output "Còpia de seguretat finalitzada correctament: '$fitxerBackupPath'"