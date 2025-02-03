#Autor: Silvia Martín
#03/02/2025
<#
Fes un script que rebi un argument de manera que:
Si és un directori mostri el missatge “El contingut del directori <nom_directori> és:” i llisti el seu contingut.
Si l’argument no és cap directori ha de donar un missatge informatiu.
#>
$Path = $args[0]  # Obtiene el primer argumento pasado al script y lo guarda en la variable $Path

# Verifica si la ruta proporcionada es un directorio (tipo "Container")
if (Test-Path $Path -PathType Container)
{
    Write-Host "El contingut del directori $Path és:"  # Si es un directorio, imprime el mensaje "El contingut del directori" seguido de la ruta del directorio
    dir $Path  # Muestra el contenido del directorio usando el cmdlet "dir"
}
else
{
    Write-Host "No es un directori"  # Si no es un directorio, imprime el mensaje "No es un directori"
}