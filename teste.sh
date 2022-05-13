#!/bin/bash

#Initializing Variables
DEFAULT_SITE="univesp.br"
FIRST_SITE=$DEFAULT_SITE
COUNT=0
COURSES_INDEX=0
DIR_COUNT=0
mkdir "Courses"
cd "Courses"
read CHOICE
COURSES_INDEX=$[ $CHOICE - 1 ]
echo $COURSES_INDEX

function Course_Chooser {
	if [[ $CHOICE -eq 1 ]]; then
		COURSE="Engenharia da Computação"
		mkdir ../"${COURSE}"
		NEW="/${COURSES[${COURSES_INDEX}]}"
	elif [[ $CHOICE -eq 2 ]]; then
		COURSE="Engenharia de Produçao"
		mkdir ../"${COURSE}"
		NEW="/${COURSES[${COURSES_INDEX}]}"
	elif [[ $CHOICE -eq 3 ]]; then
		COURSE="Licenciatura em Biologia"
		mkdir ../"${COURSE}"
		NEW="/${COURSES[${COURSES_INDEX}]}"
	elif [[ $CHOICE -eq 4 ]]; then
		COURSE="Licenciatura em Física"
		mkdir ../"${COURSE}"
		NEW="/${COURSES[${COURSES_INDEX}]}"
	elif [[ $CHOICE -eq 5 ]]; then
		COURSE="Licenciatura em Matemática"
		mkdir ../"${COURSE}"
		NEW="/${COURSES[${COURSES_INDEX}]}"
	elif [[ $CHOICE -eq 6 ]]; then
		COURSE="Licenciatura em Química"
		mkdir ../"${COURSE}"
		NEW="/${COURSES[${COURSES_INDEX}]}"
	elif [[ $CHOICE -eq 7 ]]; then
		COURSE="Pedagogia"
		mkdir ../"${COURSE}"
		NEW="/${COURSES[${COURSES_INDEX}]}"
	elif [[ $CHOICE -eq 8 ]]; then
		COURSE="Letras"
		mkdir ../"${COURSE}"
		NEW="/${COURSES[${COURSES_INDEX}]}"
	elif [[ $CHOICE -eq 9 ]]; then
		COURSE="Tecnologia da Informação"
		mkdir ../"${COURSE}"
		NEW="/${COURSES[${COURSES_INDEX}]}"
	elif [[ $CHOICE -eq 10 ]]; then
		COURSE="Ciência de Dados"
		mkdir ../"${COURSE}"
		NEW="/${COURSES[${COURSES_INDEX}]}"
	elif [[ $CHOICE -eq 11 ]]; then
		COURSE"Gestão Pública"
		mkdir ../"${COURSE}"
		NEW="/${COURSES[${COURSES_INDEX}]}"
	else
		echo "Invalid Course!"
		./teste.sh
	fi
}

function URL_Retriever {
	wget -O "page(${COUNT}).html" "${DEFAULT_SITE}"
	COUNT=$[ $COUNT + 1 ]
}

function URL_Changer {
	DEFAULT_SITE="${DEFAULT_SITE}${NEW}"
}

function Dir_Create {
	cd ../"${COURSE}"
	while [[ $DIR_COUNT -lt ${#DIRS[@]} ]]; do
		mkdir "${DIRS[${DIR_COUNT}]}"
		DIR_COUNT=$[ $DIR_COUNT + 1 ]
	done
}

URL_Retriever
NEW=$(cat "page($[ $COUNT - 1 ]).html" | grep Cursos | sed 's/  \+//g' | grep -oP '(?<=href=").*(?=">Cursos)')
URL_Changer
URL_Retriever
COURSES=($(cat "page($[ $COUNT - 1 ]).html" | grep /cursos | sed 's/  \+//g' | grep -oP '(?<=card-inverse" href="/cursos/).*(?=">)' | sed -z 's/\n/ /g'))
Course_Chooser
URL_Changer
URL_Retriever
URL_Matriz=$(cat "page($[ $COUNT - 1 ]).html" | grep Matriz | sed 's/  \+//g' | grep -oP '(?<=href=").*(?=" title=)' | sed 's/title.*//' | sed 's/"//g' | sed -z 's/ //g')
#echo $URL_Matriz
wget -O "matriz.pdf" "${FIRST_SITE}${URL_Matriz}"
pdftohtml "matriz.pdf" "matriz.html"
DIRS=($(cat "matrizs.html" | grep -i "bimestre" | sed 's/<br\/>//g' | sed 's/ //g'))
#sed -i 's/BIMESTRE.*/BIMESTRE/g' "matrizs.html"
Dir_Create
echo "${FIRST_SITE}${URL_Matriz}"
echo ${#DIRS[@]}
echo $COURSE
