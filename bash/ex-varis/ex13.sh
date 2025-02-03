#!/bin/bash
#Silvia Matin
#16/01/25
#Fer un script que mostri els usuaris del sistema que poden iniciar sessió 
#permeti accedir al sistema amb l’usuari seleccionat.
#Si l’usuari seleccionat no existeix té que 
#mostrar el missatge de “L’usuari no existeix”
echo "Selecciona el numero d'un dels següents usuaris: "

user=$(grep -v login /etc/passwd | cut -d: -f1)
select usuari in $user; do
  if [ -z "$usuari" ]; then
    echo "L'usuari no existeix"
  else
   su $usuari
   break
  fi
done
