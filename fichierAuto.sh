#!/bin/bash

chemin=$(pwd)

#cp $chemin/CompteRendu-OrdreJour/AAAA_MM_JJ_CR.docx $chemin/CompteRendu-OrdreJour/AAAA_MM_JJ_ODJ.docx $chemin/Reunions

jour=$1
mois=$2
annee=$3
erreur=0
liste=("janvier fevrier février mars avril mai juin juillet aout août septembre octobre novembre decembre décembre")


#Transforme la variable jour en jour conforme :
	# -Rajoute un 0 devant si le jour est compris entre 1 et 9
	# -Verifie que le jour entré soit bien entre 1 et 31
conversionJour() {
	if [ $erreur -eq 0 ]; then 
		if [ $jour -lt 1 ]; then
			erreur=1
			echo "Erreur jour : jour inférieur à 1"
		elif [ $jour -gt 31 ]; then
			erreur=1
			echo "Erreur jour : jour supérieur à 31"
		elif [ $jour -lt 10 ]; then
			jour="0"$jour
		fi
	fi	
	if [ $erreur -eq 0 ]; then
		echo $jour
	fi
}

#Fonction qui permet de vérifier si un élément est dans une liste
function exists_in_list() {
    LIST=$1
    DELIMITER=$2
    VALUE=$3
    LIST_WHITESPACES=`echo $LIST | tr "$DELIMITER" " "`
    for x in $LIST_WHITESPACES; do
        if [ "$x" = "$VALUE" ]; then
            return 0
        fi
    done
    return 1
}

conversionMois() {
	if [ $erreur -eq 0 ]; then 
		if exists_in_list "$liste" " " janvier; then
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
			esac
		else
			erreur=1
		fi
	fi
	echo $mois
}
#conversionMois

newName() {
	if [ $erreur -eq 0 ]; then
		jour=$(conversionJour)
		mois=$(conversionMois)
		nomFic=$annee"_"$mois"_"$jour
		echo $nomFic
	fi
}
#newName

getDate() {
	date '+%Y_%m_%d'
}
#getDate
echo $erreur
#Créer un dossier avec la date passé en parametre
#-> Forcément 3 arguments : 1er pour le jour, 2eme pour le mois, 3eme pour l'année
if [ $# -eq 3 ]; then
	nomFic=$(newName)
	echo $nomFic
	if [ $erreur -eq 0 ]; then
		if [ ! -d "Reunions/$nomFic" ]; then
			nomFic=$(newName)
			mkdir Reunions/$nomFic
			cp $chemin/CompteRendu-OrdreJour/AAAA_MM_JJ_CR.docx $chemin/CompteRendu-OrdreJour/AAAA_MM_JJ_ODJ.docx $chemin/Reunions/$nomFic

			mv $chemin/Reunions/$nomFic/AAAA_MM_JJ_CR.docx $chemin/Reunions/$nomFic/$nomFic"_CR".docx
			mv $chemin/Reunions/$nomFic/AAAA_MM_JJ_ODJ.docx $chemin/Reunions/$nomFic/$nomFic"_ODJ".docx

			echo "Dossier créé à la date donnée"
		else
			echo "Dossier deja existant"
		fi
	fi
#Créer un dossier avec la date du jour
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
