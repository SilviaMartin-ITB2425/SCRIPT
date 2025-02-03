#Autor: Silvia Martín
#03/02/2025
<#
Fes un script que calculi l’ocupació de disc de cada directori de c:\users.
#>

# Obté la llista de directoris dins de C:\Users
# Només obté els elements que són directoris
$directoris = Get-ChildItem -Path "C:\Users" -Directory

# Recorre cada directori per calcular la seva ocupació
foreach ($directori in $directoris) {
    # Calcula la mida total de tots els fitxers dins del directori (incloent subdirectoris)
    # Get-ChildItem: Obté tots els fitxers del directori actual de manera recursiva
    # -Recurse: Inclou els fitxers dins de subdirectoris
    # -File: Filtra perquè només es considerin fitxers (ignora altres directoris)
    # Measure-Object: Suma la mida (propietat Length) de tots els fitxers trobats
    $mida = Get-ChildItem -Path $directori.FullName -Recurse -File | Measure-Object -Property Length -Sum

    # Converteix la mida total (en bytes) a megabytes dividint per 1MB (1 MB = 1024 * 1024 bytes)
    $ocupacio = $mida.Sum / 1MB

    # Mostra el resultat per pantalla
    # $directori.FullName: Camí complet del directori
    # [math]::Round: Arrodoneix el resultat a 2 decimals per fer-lo més llegible
    Write-Output "Directori: $($directori.FullName) - Ocupació: $([math]::Round($ocupacio, 2)) MB"
    }