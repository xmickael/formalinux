#!/bin/bash
#shegang

#################################################################
#								#
#	NAME		: exo_1_0.sh				#
#								#
#	DESCRIPTION	: premier shell linux			#
#								#
#	DATE		: 08/11/2021				#
#								#
#	AUTEUR		: NEE MICKEL				#
#								#
#	CONTACT		: mickael.nee@atos.net			#
#								#
#	PARAM 1		: N/A					#
#	PARAM 2		: N/A					#
#	PARAM 3		: N/A					#
#								# 
#################################################################

clear
#set -o xtrace
echo "execution de $0"
echo "nb params $#"
if [ $# != 0 ]
	then
		echo "paramètres $*"
fi 

echo "Veuillez entrer un nom"
read rep

if [ -z "$rep" ]
then
	echo "ERREUR de syntaxe"
	echo "Veuillez entrer un nom"
	exit
fi

rep="$(echo $rep|tr 'A-Z' 'a-z')"

if [ "$rep" = "mickael" ]
then
	echo "Bonjour Maitre"
else
	echo "Bonjour serviteur du Maitre"
fi
