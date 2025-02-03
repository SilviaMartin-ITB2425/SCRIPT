#!/bin/bash
#script que demani 2 nombres i mostri la seva suma, resta, multiplicació i divisió.
#Silvia Matin
#15/01/25
echo "di un numero: " 
read num1
echo "di un altre numero" 
read num2

let sum=$num1+$num2
let res=$num1-$num2
let mul=$num1*$num2
let div=$num1/$num2

echo "Suma: $sum, Resta: $res, multiplicació: $mul, Divisió: $div"

