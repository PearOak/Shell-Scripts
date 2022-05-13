#!/bin/bash

string="Isso é uma string, mano!"

#Tamanho da string
echo ${#string}

#Posição numerica de uma letra que está numa substring
substring="sag"
expr index "$string" "$substring"

#Extrair substring de tamanho tam de string string começando da posição pos
pos=2
tam=5
echo ${string:$pos:$tam}

#Extrair substring sem tamanho definido
echo ${string:5}

#Exemplo
# Code to extract the First name from the data record
DATARECORD="last=Clifford,first=Johnny Boy,state=CA"
COMMA1=`expr index "$DATARECORD" ','`  # 14 position of first comma
CHOP1FIELD=${DATARECORD:$COMMA1}       #
COMMA2=`expr index "$CHOP1FIELD" ','`
LENGTH=`expr $COMMA2 - 6 - 1`
FIRSTNAME=${CHOP1FIELD:6:$LENGTH}      # Johnny Boy
echo $FIRSTNAME

#Substituição de string da primeira ocorrência
string="ser ou não ser?"
echo ${string[@]/ser/comer}

#Substituição de string de todas as ocorrências
string="ser ou não ser?"
echo ${string[@]//ser/comer}

#Deletar todas as ocorrências de uma substring
string="ser ou não ser?"
echo ${string[@]//ser/}

#Substituir ocorrencia de uma substring no começo
string="ser ou não ser?"
echo ${string[@]/#ser/comer}

#Substituir ocorrência de uma substring no fim
string="ser ou não ser?"
echo ${string[@]/%ser/comer}

#Substituir ocorrência por shell script
string="ser ou não ser?"
echo ${string[@]/%ser/ser on $(date +%Y-%m-%d)}

#Exercício
BUFFETT="Life is like a snowball. The important thing is finding wet snow and a really long hill."
# write your code here
ISAY="Life is like a snowball. The important thing is finding wet snow and a really long hill."
Change1=${ISAY[@]/snow/foot}
Change2=${Change1[@]/snow/}
Change3=${Change2[@]//finding/getting}
num=`expr index "$Change3" "w"`
delete=${Change3:(($num + 2))}
Change4=${Change3[@]//$delete/}
ISAY=$Change4









# Test code - do not modify
echo "Warren Buffett said:"
echo $BUFFETT
echo "and I say:"
echo $ISAY
