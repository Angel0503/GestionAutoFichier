#!/bin/bash

chemin=$(pwd)

#cp $chemin/CompteRendu-OrdreJour/AAAA_MM_JJ_CR.docx $chemin/CompteRendu-OrdreJour/AAAA_MM_JJ_ODJ.docx $chemin/Reunions

jour=$1
mois=$2
annee=$3
listeMois=("janvier fevrier février mars avril mai juin juillet aout août septembre octobre novembre decembre décembre")

#Transforme la variable jour en jour conforme :
	# -Rajoute un 0 devant si le jour est compris entre 1 et 9
	# -Verifie que le jour entré soit bien entre 1 et 31
function conversionJour {
	if [ $jour -lt 1 ]; then
		echo "Erreur jour : jour inférieur à 1"
		jour="erreur"
	elif [ $jour -gt 31 ]; then
		echo "Erreur jour : jour supérieur à 31"
		jour="erreur"
	elif [ $jour -lt 10 ]; then
		jour="0"$jour
	fi
	echo $jour
}

conversionMois() {
	
	case $mois in
	"janvier") mois="01"
	;;
	"fevrier") mois="02"
	;;
	"février") mois="02"
	;;
	"mars") mois="03"
	;;
	"avril") mois="04"
	;;
	"mai") mois="05"
	;;
	"juin") mois="06"
	;;
	"juillet") mois="07"
	;;
	"aout") mois="08"
	;;
	"août") mois="08"
	;;
	"septembre") mois="09"
	;;
	"octobre") mois="10"
	;;
	"novembre") mois="11"
	;;
	"decembre") mois="12"
	;;
	"décembre") mois="12"
	;;
	*)
	mois="erreur"
	;;
	esac

	echo $mois
}
#conversionMois

newName() {
	jour=$(conversionJour)
	
	mois=$(conversionMois)
		
	nomFic=$annee"_"$mois"_"$jour
	echo $nomFic
}
#newName

getDate() {
	date '+%Y_%m_%d'
}
#getDate

#Créer un dossier avec la date passé en parametre
#-> Forcément 3 arguments : 1er pour le jour, 2eme pour le mois, 3eme pour l'année
if [ $# -eq 3 ]; then
	if [ $(conversionJour) != "erreur" ]; then
		if [ $(conversionMois) != "erreur" ]; then
			nomFic=$(newName)		
		else
			echo "Erreur : mois non conforme"
		fi
	else
		echo "Erreur : jour non conforme"
	fi

	if [ ! -d "Reunions/$nomFic" ]; then
		mkdir Reunions/$nomFic

		cp $chemin/CompteRendu-OrdreJour/AAAA_MM_JJ_CR.docx $chemin/CompteRendu-OrdreJour/AAAA_MM_JJ_ODJ.docx $chemin/Reunions/$nomFic

		mv $chemin/Reunions/$nomFic/AAAA_MM_JJ_CR.docx $chemin/Reunions/$nomFic/$nomFic"_CR".docx
		mv $chemin/Reunions/$nomFic/AAAA_MM_JJ_ODJ.docx $chemin/Reunions/$nomFic/$nomFic"_ODJ".docx

		echo "Création du dossier $nomFic"
	else
		echo $nomFic
		echo "Dossier deja existant"
	fi

#Créer un dossier avec la date du jour
# -> Pas d'argument à donner
elif [ $# -eq 0 ]; then
	if [ ! -d "Reunions/$(getDate)" ]; then
		nomFic=$(getDate)
		mkdir Reunions/$nomFic
		cp $chemin/CompteRendu-OrdreJour/AAAA_MM_JJ_CR.docx $chemin/CompteRendu-OrdreJour/AAAA_MM_JJ_ODJ.docx $chemin/Reunions/$nomFic

		mv $chemin/Reunions/$nomFic/AAAA_MM_JJ_CR.docx $chemin/Reunions/$nomFic/$nomFic"_CR".docx
		mv $chemin/Reunions/$nomFic/AAAA_MM_JJ_ODJ.docx $chemin/Reunions/$nomFic/$nomFic"_ODJ".docx

		echo "Dossier du jour créé"
	else
		echo "Le dossier du jour existe déjà"
	fi

#Supprimer le dossier du jour
elif [ $# -eq 1 ] ; then
	if [ "$1" = "-d" ] || [ "$1" = "--delete" ] ; then
		if [ -d "Reunions/$(getDate)" ]; then
			rm -r Reunions/$(getDate)
			echo "Dossier d'aujourd'hui supprimmé"
		else
			echo "Le dossier d'aujourd'hui n'existe pas"
		fi
	fi

else
	echo "Mauvais arguments"
fi