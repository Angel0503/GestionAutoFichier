

jour=$1
mois=$2
listeMois=("janvier fevrier février mars avril mai juin juillet aout août septembre octobre novembre decembre décembre")

function conversionJour {
  if [ $jour -lt 1 ] || [ $jour -gt 31 ]
  then
    return 1
  else
    if [ $jour -lt 10 ]
    then
      jour="0$jour"
      echo $jour
    else
      jour=$jour
      echo $jour
    fi
    return 0
  fi
}


function estMois {
  if [[ $listeMois =~ (^|[[:space:]])"$mois"($|[[:space:]]) ]]
  then
    return 0
  else
    return 1
  fi
}

conversionMois() {
	if estMois; then
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
	fi
	echo $mois
}

newName() {
	jour=$(conversionJour)
	if [ "$jour" != " " ]; then
		mois=$(conversionMois)
		if [ conversionMois ]; then
			nomFic=$annee"_"$mois"_"$jour
			echo $nomFic
		fi
	fi
}

if conversionJour && estMois
then
  test=$(newName)
  echo $test
else
  echo "aled"
fi
