#!/bin/bash
#Creeu un directori /scripts per guardar els vostres programes,
#moveu el fitxer generat al punt anterior al directori
#/scripts i afegiu el directori al contingut de la variable PATH
#Silvia Matin
#15/01/25

mkdir $HOME/script

cp ex*.sh $HOME/script

PATH="$PATH:$HOME/scripts"

echo 'Creat el directori /scripts '
ls -l $HOME
echo "S'han mogut els fitxers dins del directori "
ls -l script;

export PATH="$PATH:$HOME/scripts"

echo "Comprovar PATH"
env | grep PATH
