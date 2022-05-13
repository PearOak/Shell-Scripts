#!/bin/bash
#Variáveis
PRECO_POR_MACA=5
PorcaoAleatoria=ABC
saudacao="Olar		Mundo!"
captura_sources=`cat /etc/apt/sources.list`

#Exemplo 1:
echo "O preço da maçã hoje é R\$ $PRECO_POR_MACA!"

#Exemplo 2:
echo "As 15 primeiras letras do alfabeto são: ${PorcaoAleatoria}DEFGHIJKLMNO"

#Exemplo 3:
echo $saudacao " é COMPLETAMENTE diferente de $saudacao"

#Exemplo 4 (Substituição):
echo $captura_sources
