#!/bin/bash

echo -e "Manda um número decimal ai:"				#Mensagem printada
read NUMERO							#Instrução que receberá input do usuário
NUMERO_INICIAL=$NUMERO						#Variáveis a ser definidas
INDICE=0
BINARIO=()							#Array vazia, esta será preenchida abaixo
STRING_BIN=""							#String vazia
BIN_FINAL=""

while [[ $NUMERO -ge 1 ]]; do					#While gera array que, no fim, vai ser o binário

	if [[ $NUMERO -eq 2 ]]; then				#Condição do bit mais significativo
		BINARIO[$INDICE]=$(($NUMERO % 2))		#Valores que estão nos índices da array
		BINARIO[$(($INDICE + 1))]=$(($NUMERO / 2))	#Valor do bit mais significativo
		RESULTADO=$(($NUMERO / 2))			#Resultado da divisão
		NUMERO=$RESULTADO				#Número passa a ser o resultado da divisão, a idéia é dividir o número até que seja indivisível (obs: Nos números naturais)
		INDICE=$(($INDICE + 1))				#Incremento do índice

	else							#Ver comentários do if, pois o procedimento é o mesmo, com exceção das condições do bit mais significativo
		BINARIO[$INDICE]=$(($NUMERO % 2))
		RESULTADO=$(($NUMERO / 2))
		NUMERO=$RESULTADO
		INDICE=$(($INDICE + 1))
	fi							#Fim do if/else
done								#Fim do while

CONT=$((${#BINARIO[@]} - 1))					#Array gerada, esta variável é referente ao tamanho da array - 1, que seria o maior índice possível

while [[ $CONT -ge 0 ]]; do					#While que vai formar a string com os números binários. A idéia é que os bits mais significativos estejam no final da array, enquanto os menos significativos são os primeiros valores
	STRING_BIN="${BINARIO[$CONT]}"				#Passa o valor da array no indice CONT para uma string
	BIN_FINAL="${BIN_FINAL}${STRING_BIN}"			#String com o número devidamente convertido
	CONT=$(($CONT - 1))					#Decremento que serve para gerar o número do bit mais significativo até o menos sigificativo

done

if [[ $NUMERO_INICIAL = 0 ]];then				#Condicional sobre a exibição do número binário
	echo "${NUMERO_INICIAL} em binário é ${NUMERO_INICIAL}"	#Condicional necessária, pois, caso o número escolhido fosse 0, o texto apareceria vazio, pois NUMERO_INICIAL é um número, não uma string. Além disso BIN_FINAL seria a mesma coisa que NUMERO_INICIAL
else
	echo "${NUMERO_INICIAL} em binário é ${BIN_FINAL}"	#Se o número não for zero, então NUMERO_INICIAL em binário vai ser BIN_FINAL
fi
