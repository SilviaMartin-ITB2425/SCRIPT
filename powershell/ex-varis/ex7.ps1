#Autor: Silvia Martín
#03/02/2025
<#
Feu un script demani el valor d’una nota (un nombre enter) i ens digui si la nota és una D (0, 1, 2), una C- (3, 4), una C+ (5, 6), una B (7, 8) o una A (9,10).
Utilitzar alguna estructura de tipus switch
#>
$Num = Read-Host "Introduce tu nota"  # Solicita al usuario que ingrese su nota y la guarda en la variable $Num

# Usa una declaración Switch para asignar la calificación según la nota ingresada
Switch ($Num)
{
    {$_ -ge 0 -and $_ -le 2} { $result = 'Tens una D'}  # Si la nota es 0, asigna la calificación "D"
    {$_ -ge 3 -and $_ -le 4}  { $result = 'Tens una C-'} # Si la nota es 3, asigna la calificación "C-"
    {$_ -ge 5 -and $_ -le 6}  { $result = 'Tens una C+'} # Si la nota es 5, asigna la calificación "C+"
    {$_ -ge 7 -and $_ -le 8}  { $result = 'Tens una B'}  # Si la nota es 7, asigna la calificación "B"
    {$_ -ge 9 -and $_ -le 10}  { $result = 'Tens una A'}  # Si la nota es 9, asigna la calificación "A"
    default { "Nota fora de rang"}  # Si la nota no está entre 0 y 10, se asigna "Nota fora de rang"
}

