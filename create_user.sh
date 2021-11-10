#!/bin/bash



if [ $# -ne 1 ]
then
	echo "Erreur de syntaxe"
	echo "$0 utilisateur"
	exit
fi	

user=$1


if grep "$user" /etc/passwd 
then
	echo "L'utilisateur $user existe déjà !!!"
	exit
fi

echo "Ajout de l'utilisateur << $user >> ..."
groupadd $user
gid=$(tail -1  /etc/group|cut -d: -f3)
echo "Ajout du nouveau groupe  << $user >> ($gid) ..."


useradd -g $gid  -d /home/$user -m -s /bin/bash -k /etc/skel $user 
uid=$(tail -1 /etc/passwd|cut -d: -f3)
echo "Ajout du nouvel utilisateur << $user >> ($uid) avec le groupe << $user>> ..."

mdp=1
mdp2=2
while [ "$mdp" != "$mdp2" ]
do
	echo "Nouveau mot de passe :"
	read mdp
	echo "Retapez le nouveau mot de passe :"
	read mdp2
done
passwd $user << EOF
$mdp
$mdp
EOF


echo "Modification des infos sur l'utilisateur << $user >>"
echo "Ajouter une valeur ou appuyer sur ENTREE par défaut"
echo -en "\tNom complet []: "; read nom
echo -en "\tNuméro du bureau []: ";read bureau
echo -en "\tTéléphone pro []: " ;read pro
echo -en "\tTéléphone perso []: " ;read perso
echo -en "\tAutre info []: " ;read info

echo -n "Cette information est-elle correcte ? [O/n] "
reponse="O"
read reponse
case $reponse in 
	o) chfn -f "$nom" -h "$perso" -r "$bureau" -w "$pro" -o "$info" $user;;
	O) chfn -f "$nom" -h "$perso" -r "$bureau" -w "$pro" -o "$info" $user;;
	*) exit;;
esac

echo "L'utilisateur << $user >> a été créé avec un uid=$uid et un gid=$gid"
echo "L'utilisateur << $user >> a accès à l'outil <<cheat>>"
echo

chmod 700 /home/$user




