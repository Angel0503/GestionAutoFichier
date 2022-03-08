#!/bin/bash

chemin=$(pwd)

#cp $chemin/CompteRendu-OrdreJour/AAAA_MM_JJ_CR.docx $chemin/CompteRendu-OrdreJour/AAAA_MM_JJ_ODJ.docx $chemin/Reunions

jour=$1
mois=$2
annee=$3

conversionJour() {

	if [ $jour -lt 10 ]
	then
		jour="0"$jour
	fi
	echo $jour
}
#conversionJour

conversionMois() {

	case $mois in
	"janvier") mois="01"
	;;
	"fevrier") mois="02"
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
	"septembre") mois="09"
	;;
	"octobre") mois="10"
	;;
	"novembre") mois="11"
	;;
	"decembre") mois="12"
	;;
	esac
	echo $mois
}
#conversionMois

newName() {
	jour=$(conversionJour)
	mois=$(conversionMois)
	nomFic=$annee"_"$mois"_"$jour"_""test"
	echo $nomFic
}
#newName


if [ $n -ne 0 ]; then
	if [ ! -d "Reunions/$nomFic" ]; then
		echo Different de zero
		nomFic=$(newName)
		mkdir Reunions/$nomFic
		cp $chemin/CompteRendu-OrdreJour/AAAA_MM_JJ_CR.docx $chemin/CompteRendu-OrdreJour/AAAA_MM_JJ_ODJ.docx $chemin/Reunions/$nomFic

		mv $chemin/Reunions/$nomFic/AAAA_MM_JJ_CR.docx $chemin/Reunions/$nomFic/$nomFic"_CR".docx
		mv $chemin/Reunions/$nomFic/AAAA_MM_JJ_ODJ.docx $chemin/Reunions/$nomFic/$nomFic"_ODJ".docx
	else
		echo "Fichier deja existant"
	fi
elif [ $n -eq 0 ]; then
	echo pas args
	echo $DATE
else
	echo rien
fi