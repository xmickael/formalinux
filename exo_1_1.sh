#!/bin/bash
#shegang

#################################################################
#								#
#	NAME		: exo_1_2.sh				#
#								#
#	DESCRIPTION	: evolution avec passage de paramètres 	#
#								#
#	DATE		: 08/11/2021				#
#								#
#	AUTEUR		: NEE MICKEL				#
#								#
#	CONTACT		: mickael.nee@atos.net			#
#								#
#	PARAM 1		: Un nom				#
#	PARAM 2		: un autre nom				#
#	PARAM *		: encore d autre			#
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

if [ $# = 0 ]
then
		echo "ERREUR - Merci de rentrer au mins 1 paramètre"
		exit
fi 

#echo "Veuillez entrer un nom"
#read rep

for rep in $@
do
	rep="$(echo $rep|tr 'A-Z' 'a-z')"

	if [ "$rep" = "mickael" ]
	then
		echo "Bonjour Maitre"
	else
		echo "Bonjour $rep, serviteur du Maitre"
	fi
done

echo " "
echo "############### FIN DU SCRIPT ####################"
exit 0
