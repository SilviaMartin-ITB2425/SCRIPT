#!/bin/bash
#Silvia Matin
#16/01/25
#Root és qui està executant el guió de shelli donar un missatge depenent
#de si ho és o no.

#Comprovar si l'usuari és root
if [ "$EUID" -eq 0 ]; then 
  echo "Estàs executant lscipts com a root."

else 
  echo "Aquest script només pot ser executat per root."
  exit 1
fi 
