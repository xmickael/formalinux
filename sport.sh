#!/bin/bash
#shegang

#################################################################
#								#
#	NAME		: sportif.sh				#
#								#
#	DESCRIPTION	: va lire un fichiers de sportif	#
#								#
#	DATE		: 09/11/2021				#
#								#
#	AUTEUR		: NEE MICKEL				#
#								#
#	CONTACT		: mickael.nee@atos.net			#
#								#
#	PARAM 1		: -					#
#	PARAM 2		: -					#
#	PARAM *		: -					#
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

while read ligne
do
	qui=$(echo $ligne|cut -d" " -f1)
	set $ligne
	let combien=$#-1
	shift
	quoi=$*

	echo "$qui fait $combien sport(s) : $quoi"

done < sportif.txt
