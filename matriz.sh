#!/bin/bash

DADO1=(1 2 3 4 5 6)
DADO2=(1 2 3 4 5 6)

CONT1=0
CONT2=0
VALIDOA=()
CONTVA=0

EXA=""

while [[ $CONT1 -lt ${#DADO1[@]} ]]; do
	while [[ $CONT2 -lt ${#DADO2[@]} ]]; do
		echo "${DADO1[$CONT1]},${DADO2[$CONT2]}"
		if [[ $(( ${DADO1[$CONT1]} + ${DADO2[$CONT2]} )) -eq 6 ]]; then
			EXA="${EXA}${DADO1[$CONT1]},${DADO2[$CONT2]}; "
			VALIDOA[$CONTVA]="${DADO1[$CONT1]},${DADO2[$CONT2]}"
			CONTVA=$(( $CONTVA + 1 ))
		fi
		CONT2=$(( $CONT2 + 1 ))
	done
	CONT1=$(( $CONT1 + 1 ))
	CONT2=0
done

echo "Os valores ${EXA} são válidos para a solução do problema"
echo "o total de possibilidades cuja soma das faces seja 6 é: ${#VALIDOA[@]}"
