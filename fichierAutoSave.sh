#!/bin/bash

chemin=$(pwd)

#cp $chemin/CompteRendu-OrdreJour/AAAA_MM_JJ_CR.docx $chemin/CompteRendu-OrdreJour/AAAA_MM_JJ_ODJ.docx $chemin/Reunions

jour=$1
mois=$2
annee=$3
listeMois=("janvier fevrier février mars avril mai juillet aout août septembre octobre novembre decembre décembre")

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

function estMois {
  if [[ $listeMois =~ (^|[[:space:]])"$mois"($|[[:space:]]) ]]; then
    return 0
  else
    return 1
  fi
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

if exists_in_list "$listeMois" " " $mois; then
	echo "mois ok"
else
	echo "mois pas ok"
fi

