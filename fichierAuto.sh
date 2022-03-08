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
	nomFic=$annee"_"$mois"_"$jour
	echo $nomFic
}
#newName

getDate() {
	date '+%Y_%m_%d'
}

if [ $# -eq 3 ]; then
	nomFic=$(newName)
	if [ ! -d "Reunions/$nomFic" ]; then
		nomFic=$(newName)
		mkdir Reunions/$nomFic
		cp $chemin/CompteRendu-OrdreJour/AAAA_MM_JJ_CR.docx $chemin/CompteRendu-OrdreJour/AAAA_MM_JJ_ODJ.docx $chemin/Reunions/$nomFic

		mv $chemin/Reunions/$nomFic/AAAA_MM_JJ_CR.docx $chemin/Reunions/$nomFic/$nomFic"_CR".docx
		mv $chemin/Reunions/$nomFic/AAAA_MM_JJ_ODJ.docx $chemin/Reunions/$nomFic/$nomFic"_ODJ".docx
	else
		echo "Fichier deja existant"
	fi
elif [ $# -eq 0 ] && [ ! -d "Reunions/$(getDate)" ]; then
	echo pas args
	nomFic=$(getDate)
	mkdir Reunions/$nomFic
	cp $chemin/CompteRendu-OrdreJour/AAAA_MM_JJ_CR.docx $chemin/CompteRendu-OrdreJour/AAAA_MM_JJ_ODJ.docx $chemin/Reunions/$nomFic

	mv $chemin/Reunions/$nomFic/AAAA_MM_JJ_CR.docx $chemin/Reunions/$nomFic/$nomFic"_CR".docx
	mv $chemin/Reunions/$nomFic/AAAA_MM_JJ_ODJ.docx $chemin/Reunions/$nomFic/$nomFic"_ODJ".docx
else
	echo "Fichier d'aujourd'hui déjà créé ou mauvais arguments"
fi