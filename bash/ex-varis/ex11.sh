#!/bin/bash
#Silvia Matin
#15/01/25
# Calcula l'ocupació dels directoris de /home

cd /home
for DIR in $(ls); do
  if [ -d $DIR ]; then
  #Espai ocupat pel directori
    du -sh $DIR
  fi
done
