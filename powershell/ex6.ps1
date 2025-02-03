#Autor: Silvia Martín
#03/02/2025
<#
Feu un script demani el valor d’una nota (un nombre enter) i ens digui si la nota és una D (0, 1, 2), una C- (3, 4), una C+ (5, 6), una B (7, 8) o una A (9,10).
Utilitzar alguna estructura de tipus if-else
#>
$Num = Read-Host "Introduce tu nota"  # Solicita al usuario que ingrese su nota y la guarda en la variable $Num

#Convertir el valor en enter
$Num= [int]$Num
# Verifica si la nota está fuera del rango válido (debe ser entre 0 y 10)
if (($Num -lt 0) -and ($Num -gt 10))
{
    Write-Host "Fora de rang"  # Si la nota está fuera del rango 0-10, imprime "Fora de rang" (fuera de rango en catalán)
}

# Si la nota es menor que 3, se asigna la calificación "D"
elseif ($Num -lt 3)
{
    Write-Host "Tens una D"  # Si la nota es menor que 3, imprime "Tens una D"
}

# Si la nota es menor que 5, pero mayor o igual a 3, se asigna la calificación "C-"
elseif ($Num -lt 5)
{
    Write-Host "Tens una C-"  # Si la nota es menor que 5, imprime "Tens una C-" (calificación C-)
}

# Si la nota es menor que 7, pero mayor o igual a 5, se asigna la calificación "C+"
elseif ($Num -lt 7)
{
    Write-Host "Tens una C+"  # Si la nota es menor que 7, imprime "Tens una C+" (calificación C+)
}

# Si la nota es menor que 9, pero mayor o igual a 7, se asigna la calificación "B"
elseif ($Num -lt 9)
{
    Write-Host "Tens una B"  # Si la nota es menor que 9, imprime "Tens una B" (calificación B)
}

# Si la nota es mayor o igual a 9, se asigna la calificación "A"
else
{
    Write-Host "Tens una A"  # Si la nota es mayor o igual a 9, imprime "Tens una A" (calificación A)
}