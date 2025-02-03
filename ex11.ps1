#Autor: Silvia Martín
#03/02/2025
<#
Extreure en un CSV tots els usuaris que estan inhabilitats al sistema Windows.
#>
# Ruta del fitxer CSV on es desaran els usuaris inhabilitats
$csvPath = "C:\Users\isard\Desktop\usuaris_inhabilitats.csv"

# Obté tots els usuaris locals del sistema
# Utilitzant Get-LocalUser es recuperen tots els usuaris configurats en el sistema Windows
$usuaris = Get-LocalUser

# Filtra només els usuaris que estan inhabilitats
# El filtre selecciona només aquells usuaris que tenen la propietat 'Enabled' establerta a 'false'
$usuarisInhabilitats = $usuaris | Where-Object { $_.Enabled -eq $false }

# Converteix els usuaris inhabilitats a un format adequat per guardar en CSV
# Aquí seleccionem només les propietats que ens interessen: 'Name' (Nom de l'usuari) i 'FullName' (Nom complet de l'usuari)
$sortidaCsv = $usuarisInhabilitats | Select-Object Name, FullName

# Desa la informació al fitxer CSV
# Export-Csv desarà les dades filtrades en el fitxer especificat a la variable $csvPath
# El paràmetre '-NoTypeInformation' evita que es guardi informació extra al CSV sobre el tipus d'objecte
# L'ús de '-Encoding UTF8' assegura que el fitxer CSV s'exporti amb la codificació correcta
$sortidaCsv | Export-Csv -Path $csvPath -NoTypeInformation -Encoding UTF8

# Missatge informatiu per a l'usuari
# Aquesta línia imprimeix un missatge que indica que el procés ha acabat i que els usuaris inhabilitats s'han desat correctament al fitxer CSV
Write-Output "Els usuaris inhabilitats s'han desat al fitxer: $csvPath"