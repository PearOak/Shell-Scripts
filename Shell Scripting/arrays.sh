#!/bin/bash

#Atribuindo arrays:

array_qualquer=(1 2 3 4 5 6 7 8 9)

#Contando elementos do array

echo ${#array_qualquer[@]}

#Acessando conteúdo de uma array

echo ${array_qualquer[5]}

#Adicionando conteúdo na array

array_qualquer[3]=15

echo ${array_qualquer[3]}

#Verificando o número de elementos numa array
echo ${#array_qualquer[@]}

#Acessando o último elemento da array sem saber quantos elementos ela tem
echo ${array_qualquer[${#array_qualquer[@]}-1]}
