#!/bin/bash
#Silvia Matin
#15/01/25
# Mostra ocupació dels directoris rebuts per paràmetre
# Crida: espai.sh DIR1 DIR2 DIR3 

for DIR in $*; do
  if [ -d $DIR ]; then
  # Calcular espai ocupat pel directori
    du -sh $DIR
  else
    echo "Error: $DIR no és cap directori."
  fi
done
