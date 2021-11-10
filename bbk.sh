#!/bin/bash
#shegang

#################################################################
#								#
#	NAME		: bbk.sh				#
#								#
#	DESCRIPTION	: shell de backup			#
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

if [ ! -e /usr/sbin/mount.cifs ]
then
	apt intall cifs-utils -y
fi

if [ ! -d /mnt/windows ]
then
	mkdir /mnt/windows
fi

mount.cifs //192.168.20.109/Users/Administrateur/Documents -0 credentials=/home/stage/.credentials /mnt/windows

rsync -av --progress --delete --backup --backup-dir
