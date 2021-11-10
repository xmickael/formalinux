#!/bin/bash
#shegang

#################################################################
#								#
#	NAME		: naissance.sh				#
#								#
#	DESCRIPTION	: Renvoi le jour de naissance de la	# 
#			  date passée en paramètre		#
#								#
#	DATE		: 09/11/2021				#
#								#
#	AUTEUR		: NEE MICKEL				#
#								#
#	CONTACT		: mickael.nee@atos.net			#
#								#
#	PARAM 1		: JOUR					#
#	PARAM 2		: MOIS					#
#	PARAM 3		: ANNEE					#
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
if [ $# -ne 3 ]
	then
 		echo "Erreur de paramètres"
		echo "3 paramètres attentus :"
		echo "1. Jour"
		echo "2. Mois"
		echo "3. Annee"
		echo "EX : 17 4 1985"
		exit
fi

jour=$1
mois=$2
annee=$3
j=""

if  [ $jour -lt 7 ]
	then
		let jour=$jour+7
fi

ligne="$(cal $mois $annee|grep -w $jour)"

set $ligne

case $jour in 
	$1) j="dimanche";;
	$2) j="lundi";;
	$3) j="mardi";;
	$4) j="mercredi";;
	$5) j="jeudi";;
	$6) j="vendredi";;
	$7) j="samedi";;
	*)  j="oups";;
esac

echo "Vous êtes né un $j"

echo " "
echo "############### FIN DU SCRIPT ####################"

