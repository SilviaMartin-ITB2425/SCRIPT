#Autor: Silvia Martín
#03/02/2025
<#
A partir d’un fitxer CSV que contindrà el següent format:
Fer un script que llegeixi cada línia faci lo següent:
Si no existeix l’usuari al sistema el crearà.
Crea el directori posat al CSV comprovant primer que no existeixi.

Cal que es controli que el fitxer existeix. Sinó donar un missatge d’error i sortir.

#>
# Ruta del fitxer CSV que conté els usuaris i els directoris
$Directori= "C:\Users\isard\Desktop\ex10.csv"

# Comprova si el fitxer CSV existeix
if (-not (Test-Path -Path $Directori -PathType Leaf)) {
    # Si el fitxer no existeix, mostra un missatge d'error i surt
    Write-Output "Error: El fitxer CSV '$csvPath' no existeix. Si us plau, comprova la ruta."
    exit  # Finalitza l'execució del script
}

# Llegeix el fitxer CSV
# S'espera que el fitxer tingui dues columnes: "NomUsuari" i "Directori"
$usuaris = Import-Csv -Path $Directori

# Itera sobre cada línia del fitxer CSV
foreach ($usuari in $usuaris) {
    # Assigna els valors de les columnes del CSV a variables
    $nomUsuari = $usuari.NomUsuari      # Columna 'NomUsuari'
    $directori = $usuari.Directori      # Columna 'Directori'

    # Comprova si l'usuari existeix al sistema
    if (-not (Get-LocalUser -Name $nomUsuari -ErrorAction SilentlyContinue)) {
        # Si l'usuari no existeix, el crea
        Write-Output "L'usuari '$nomUsuari' no existeix. Creant usuari..."
        New-LocalUser -Name $nomUsuari -NoPassword -Description "Usuari creat automàticament"
        Write-Output "Usuari '$nomUsuari' creat amb èxit."
    } else {
        # Si l'usuari ja existeix, mostra un missatge
        Write-Output "L'usuari '$nomUsuari' ja existeix."
    }

    # Comprova si el directori indicat existeix
    if (-not (Test-Path -Path $directori)) {
        # Si el directori no existeix, el crea
        Write-Output "El directori '$directori' no existeix. Creant directori..."
        New-Item -Path $directori -ItemType Directory
        Write-Output "Directori '$directori' creat amb èxit."
    } else {
        # Si el directori ja existeix, mostra un missatge
        Write-Output "El directori '$directori' ja existeix."
    }
}