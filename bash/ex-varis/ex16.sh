#!/bin/bash
#Silvia Matin
#16/01/25
#Script que busca la palabra messi al fitxer /etc/passwd i donar diferents 
#Missatges segons si el troba o no.

Usuari="messi"

#Comprovar si l'usuari existeix ak fitxer /etc/passwd
if grep -q "^$Usuari:" /etc/passwd; then 
  echo "L'usuari $Usuari existeix al sistema"

else 
  echo "L'usuari $Usuari NO existeix al sistema."
fi
