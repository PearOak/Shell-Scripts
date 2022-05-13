
function Primo {
	CONT=1
	DIV=0

	while [[ $CONT -le $NUMERO ]]; do
		if [[ $[ $CONT2 % $CONT ] -eq 0 ]]; then
			DIV=$[ $DIV + 1 ]
		fi
		CONT=$[ $CONT + 1 ]
	done

}

#echo "Digite um número: "
#read NUMERO
#Primo
