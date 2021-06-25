#!/bin/bash

echo "Digite o grau do polinômio"
read POT
POT_ORG=$POT
while [[ $POT -ge 0 ]]; do
	COEF=$(seq -1000 1000 | shuf -n 1)
	COEF_DER=$[ $COEF * $POT ]
	POT_DER=$[ $POT - 1 ]
	if [[ ( $POT -eq 0 ) && ( $COEF -gt 0 ) ]]; then
		POL="${POL} + $COEF"
		DER="${DER}"
	elif [[ ( $POT -eq 0 ) && ( $COEF -lt 0 ) ]]; then
		POL="${POL} ${COEF}"
		DER="${DER}"
	elif [[ ( $COEF -gt 0 ) && ( $POL != "" ) ]]; then
		POL="${POL} + ${COEF}x^${POT}"
		if [[ $POT_DER -eq 0 ]]; then
			DER="${DER} + ${COEF_DER}"
		else
			DER="${DER} + ${COEF_DER}x^${POT_DER}"
		fi
	elif [[ $COEF -eq 0 ]]; then
		POL="${POL}"
		DER="${DER}"
	else
		POL="${POL} ${COEF}x^${POT}"
		if [[ $POT_DER -eq 0 ]]; then
			DER="${DER} ${COEF}"
		else
			DER="${DER} ${COEF_DER}x^${POT_DER}"
		fi
	fi
	POT=$[ $POT - 1 ]
done

echo "f(x) =${POL}"
echo "f'(x) =${DER}"
