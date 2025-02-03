#Silvia Martin
#23/01/2025
#v1
<#
Crear directori script, moure scripts, afegir el path al sistema
#>
#New-Item: Crea un elemento nuevo. -ItemType: Tipus ,-Name: nom, -Path: Directori

New-Item -ItemType Directory -Name script -Path C:\Users\isard\Desktop\script

#Copy-Item: Copia un elemento de una ubicación a otra.
Copy-Item C:\Users\isard\Documents\ex*.ps1 -Destination C:\Users\isard\Desktop\script\

#dir: Muestra una lista de los archivos y subdirectorios de un directorio.
dir C:\Users\isard\Desktop\script

#Añade a la lista de path de las variables de entorno lo indicado
$Env:path += “;C:\Users\isard\Desktop\script\"