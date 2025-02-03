#!/bin/bash
#script que demani 2 nombres i mostri la seva suma, resta, multiplicació i divisió.
#Silvia Matin
#15/01/25
# execució: ex7 valor1

# Control del nombre de paràmetres
if [ $# -ne 1 ]; then
  echo "Nombre d'arguments erroni."
  echo "Ús del programa: $0 nom"
  exit 1
fi

# Comprovar si el paràmetre és un fitxer
if [ -f $1 ]; then
  echo "$1 és un fitxer."
  fi

exit 0




