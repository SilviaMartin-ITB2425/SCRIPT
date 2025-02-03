#!/bin/bash
# Rep el nom d'un directori per paràmetre i en mostra el contingut.
#Silvia Matin
#15/01/25
# execució: ex8 valor1

# Control del nombre de paràmetres.
if [ $# -ne 1 ]; then
  echo "Nombre d'arguments erroni."
  echo "Ús del programa: $0 nom_directori"
  exit 1
fi

# Comprovar si el paràmetre és un directori.
if [ -d $1 ]; then
  echo "El contingut del directori $1 és:"
  ls -l $1
else
  echo "$1 no és un directori."
fi

exit 0
