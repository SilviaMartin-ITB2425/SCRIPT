#!/bin/bash
#Silvia Matin
#16/01/25
#La còpia cal fer-la amb la comanda tar i que comprimeixi el contingut.
#El nom del fitxer ha de ser backup_nom_directori_YYYYMMDD.tar.gz
#L’script cal que controli primer que no existeixi ja un fitxer prèviament amb el mateix nom. Si és així, l’script donarà error i pararà, 
#retornant codi 2
#Si no existeix el directori a fer-ne la còpia,
#l’script donarà error i pararà, retornant codi 1

# Comprovar execució del programa
if [ $# -ne 1 ]; then
  echo "Nombre d'arguments erroni."
  echo "Ús del programa: $0 nom_directori"
  exit 1
fi

arxiu=$1
nom=backup_"$arxiu"_$(date +"%Y%m%d").tar.gz
desti:=$(pwd)

# Comprovar que no existeix ja un fitxer amb el mateix nom
if [ ! -d "$nom"]; then
  echo "Error: El directori '$arxiu' no existeix"
  exit 1
fi 

if [ -f "$desti/$nom" ]; then
  echo "Ja existeix la còpia."
  exit 2
fi 

tar -czvf "$nom" "$arxiu" &>/dev/null

if [ "$?" -eq 0 ]; then 
  echo "Còpia de seguretat creada amb èxit: $nom"
  exit 0 

else 
  echo "Error: No s'ha pogut crear la còpia de seguretat."
  exit 3
fi 

