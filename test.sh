#!/bin/bash

chemin=$(pwd)

mois=$1

listeMois=("janvier fevrier février mars avril mai juin juillet aout août septembre octobre novembre decembre décembre")

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

conversionMois
