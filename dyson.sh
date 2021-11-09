#!/bin/bash
#shegang

#################################################################
#								#
#	NAME		: dyson.sh				#
#								#
#	DESCRIPTION	: Aspirateur de site web		#
#								#
#	DATE		: 08/11/2021				#
#								#
#	AUTEUR		: NEE MICKEL				#
#								#
#	CONTACT		: mickael.nee@atos.net			#
#								#
#	PARAM 1		: 					#
#	PARAM 2		: 					#
#	PARAM *		: 					#
#								# 
#################################################################

clear

#set -o xtrace

echo "############# Execution du script #################"
echo "Nom du script : $0"
echo "Nb params : $#"
if [ $# != 0 ]
	then
		echo "Liste des paramètres [$*]"
fi

echo "############### DEBUT DU SCRIPT ###################"
echo " "

if [ $# != 4 ]
then
	echo "4 paramètres attendus"
	echo "1.URL"
	echo "2.Extention"
	echo "3. Nb Fichier"
	echo "4. Destination"
	echo " "
	echo "Exemple : http://www.test.com pdf 5 dossier_test"
	exit
fi

url=$1
ext=$2
nb_fic=$3
dest=$4

#creation du dossier si non present
if [ ! -d "$dest" ]
	then 
		mkdir -vp "$dest" #p pour les sous repertoire
fi

cd "$dest"

#5000 pour recupérere la liste des 5000 premier fichier
#head pour prendre les $nb_fic de la liste des fichiers
#cut pour découper la liste 
# grep $ext$ pour ne prendre les lignes qui finissent pas $ext

wget $(lynx -dump "$url" | grep -wA  5000 "6. http"|grep $ext$|cut -c7-|head -$nb_fic )

echo " "
echo "############### FIN DU SCRIPT ####################"
