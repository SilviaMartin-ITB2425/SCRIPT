#!bin/bash
while true; do
	read -p "Introdueix un nom per al grup: " nom_grup
	echo $nom_grup
	if grep -q "^$nom_grup:" /etc/group; then
		echo "Error: El nom del grup "$nom_grup" ja existeix, tria un altre nom:"
	else
		if command -v addgroup &> /dev/null; then
			addgroup $nom_grup
	elif command -v groupadd &> /dev/null; then
			groupadd $nom_grup
		fi
		if [ $? -eq 0 ]; then
			echo "El grup s'ha creat amb exit"
		fi
		break
	fi
done
while true; do
        read -p "Introdueix un nom per a l'usuari: " nom_usuari
        echo $nom_usuari
        if grep -q "^$nom_usuari:" /etc/passwd; then
                echo "Error: El nom de l'usauri "$nom_usuari" ja existeix, tria un altre: "
        else
                if command -v useradd &> /dev/null; then
                        useradd $nom_usuari
        elif command -v useradd &> /dev/null; then
                        useradd $nom_usuari
                fi
                if [ $? -eq 0 ]; then
                        echo "L'usuari s'ha creat amb exit"
			sudo passwd $nom_usuari
			sudo mkdir /$nom_usuari
			sudo chown $nom_usuari:$nom_grup /$nom_usuari
			sudo chmod 1770 /$nom_usuari
			ls -l /
                fi
                break
	useradd -g $nom_usuari $nom_grup
	usermod -s /bin/bash $nom_usuari
        fi
done
