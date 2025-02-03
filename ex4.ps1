#Silvia Martin
#23/01/2025
#v1
<#
Fes un script que indiqui si un nom donat com a paràmetre és un fitxer regular o un directori.
#>
#Read-Host: Lee una línea de entrada de la consola.

$Path = Read-Host "Introduce lo que quieres buscar"  # Solicita al usuario que ingrese una ruta y la guarda en la variable $Path

# Verifica si la ruta proporcionada es un archivo (tipo "Leaf")
if (Test-Path $Path -PathType Leaf)
{
    Write-Host "Es un fitxer"  # Si es un archivo, imprime "Es un fitxer" (archivo en catalán)
}

# Si no es un archivo, verifica si es un directorio (tipo "Container")
elseif (Test-Path -Path $Path -PathType Container)
{
    Write-Host "Es un directori"  # Si es un directorio, imprime "Es un directori" (directorio en catalán)
}
else
{
    Write-Host "No s'ha trobat"  # Si no es ni archivo ni directorio, imprime "No s'ha trobat" (no se ha encontrado en catalán)
}
