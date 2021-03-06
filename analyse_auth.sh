#!/bin/bash
#shegang

#################################################################
#								#
#	NAME		: analyse_auth				#
#								#
#	DESCRIPTION	: analyse un fichier auth.sh		#
#								#
#	DATE		: 09/11/2021				#
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

intrus_user=$(cat auth.log|grep -w "Failed"|tr -s "  "|cut -d" " -f11|sort -u)
echo "liste des user intrus"
#echo $intrus_user
for user in $intrus_user
do
        n=$(cat auth.log|grep -w "Failed"|grep -w $user|wc -l)
	echo "$user -> $n fois"
done


intrus_ip=$(cat auth.log|grep -w "Failed"|tr -s "  "|cut -d" " -f13|sort -un)
echo " "
echo "liste des ip intrus"
echo $intrus_ip
for ip in $intrus_ip
do
        n=$(cat auth.log|grep -w "Failed"|grep -w $ip|wc -l)
        echo "$ip -> $n fois"
done


ok_user=$(cat auth.log|grep -w "Accepted"|tr -s "  "|cut -d" " -f9|sort -u)
echo " "
echo "liste des user valides"
for user in $ok_user
do
        n=$(cat auth.log|grep -w "Accepted"|grep -w $user|wc -l)
        echo "$user -> $n fois"
done

ok_ip=$(cat auth.log|grep -w "Accepted"|tr -s "  "|cut -d" " -f11|sort -un)
echo " "
echo "liste des ip valides"
#echo $ok_ip
for ip in $ok_ip
do
	n=$(cat auth.log|grep -w "Accepted"|grep -w $ip|wc -l)
	echo "$ip -> $n fois"
done 
