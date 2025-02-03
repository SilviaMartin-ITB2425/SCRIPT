#Autor: Silvia Martín
#03/02/2025
<#
<#
Fes un script que calculi l’ocupació de disc de cada directori que rebem per paràmetre.
#>
#>
# Comprova si s'han proporcionat arguments
if (-not $args -or $args.Count -eq 0) {
    # Si no es passen arguments, mostra un missatge d'ús i surt del script
    Write-Output "Ús del script: ./calcular_ocupacio.ps1 <directori1> <directori2> ..."
    Write-Output "Exemple: ./calcular_ocupacio.ps1 C:\Users\Usuari1 C:\Users\Usuari2"
    exit  # Finalitza l'execució del script
}

# Recorre cada directori facilitat com a argument
foreach ($directori in $args) {
    # Comprova si el directori existeix i és un contenidor (directori)
    if (-not (Test-Path -Path $directori -PathType Container)) {
        # Si el directori no existeix o no és vàlid, mostra un missatge d'error
        Write-Output "El directori '$directori' no existeix o no és un directori vàlid."
        continue  # Passa al següent directori de la llista
    }

    # Calcula la mida total dels fitxers dins del directori i dels seus subdirectoris
    # Get-ChildItem: Obté tots els fitxers dins del directori (de manera recursiva)
    # Measure-Object: Suma la mida (propietat Length) de tots els fitxers trobats
    $mida = Get-ChildItem -Path $directori -Recurse -File | Measure-Object -Property Length -Sum

    # Converteix la mida total de bytes a megabytes
    # 1MB = 1024 * 1024 bytes
    $ocupacio = $mida.Sum / 1MB

    # Mostra el resultat del càlcul a la consola
    # [math]::Round: Arrodoneix el resultat a 2 decimals per millorar-ne la llegibilitat
    Write-Output "Directori: $directori - Ocupació: $([math]::Round($ocupacio, 2)) MB"
}