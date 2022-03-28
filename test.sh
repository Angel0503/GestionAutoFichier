

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
    fi
    return 0
  fi
}

#
# if conversionJour
# then
  #   echo "Oui"
  #   echo $jour
  # else
  #   echo "non !"
  # fi


function estMois {
  if [[ $listeMois =~ (^|[[:space:]])"$mois"($|[[:space:]]) ]]
  then
    return 0
  else
    return 1
  fi
}


if conversionJour && estMois
then
  echo "zojfaz"
else
  echo "aled"
fi
