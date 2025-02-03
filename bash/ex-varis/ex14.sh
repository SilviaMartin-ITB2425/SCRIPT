#!/bin/bash
#Silvia Matin
#16/01/25
#Comprova que l’usuari no existeixi al sistema.
#Si no existeix crea l’usuari al sistema amb les dades indicades al fitxer.

# 1: verificar argument
if [ "$#" -ne 1 ]; then
    echo "Uso: $0 " | tee -a logs.txt
    exit 1
fi

# 2: verificar arxiu
if [ ! -f "$1" ]; then
    echo "El fitxer $1 no existeix." | tee -a logs.txt
    exit 1
fi

# 3: llegir csv
while IFS=',' read -r nom_usuari shell home password email; do
    # 4: comprovar si l'usuari existeix
    if id "$nom_usuari" &>/dev/null; then
        echo "Usuari $nom_usuari ja existent al sistema" | tee -a logs.txt
    else
        # 5: crear usuari
        useradd -m -s "$shell" -d "$home" -p "$(openssl passwd -1 "$password")" "$nom_usuari" && \
        echo "Usuari $nom_usuari donat d’alta al sistema" | tee -a logs.txt
    fi
done < "$1"

