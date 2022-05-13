#!/bin/bash

#Este programa tem como objetivo automatizar os downloads de ebooks gratuitos da editora Springer, disponibilizados durante a pandemia de Covid-19
#Pelo fato de eu ter me interessado por vários livros de vários assuntos, achei melhor fazer download de todos e remover aqueles que não me interessavam.
#Obs: Muito provavelmente eles não estarão disponibilizados para sempre, então, pode ser que este script se torne inútil futuramente
#A idéia é praticar o webscraping, em que o programador se utiliza do código HTML de uma página e consegue obter informações específicas dela, como tabelas, fotos, entre outras

mkdir Livros #Cria diretório livros
cd Livros #Vai para diretório livros
wget -O livros.pdf "https://nocaute.blog.br/wp-content/uploads/2020/04/Springer-Ebooks.pdf.pdf" #Baixando PDF com as listas dos livros
pdftotext livros.pdf #Converte pdf para txt
cat livros.txt | grep http > lista.txt #Cria arquivo novo com o URL de todos os livros
sed -zi 's/\n/ /g' lista.txt #Substitui quebras de linha por espaços
LIVROS=($(cat lista.txt)) #Cria array com cada um dos links
CONT=0 #Contador que passa por todos os livros
echo "${#LIVROS[@]}" #Exibe tamanho da array (apenas para verificar se deu certo)

while [[ $CONT -lt ${#LIVROS[@]} ]]; do #Looping que percorre cada livro da lista
	wget -O "livro${CONT}.html" "${LIVROS[${CONT}]}" #Baixa conteúdo da pag html e a nomeia de livro<num>.htmk
	TITULO=$(sed -n '/book-title/{n;p}' "livro${CONT}.html" | sed 's/  \+//g' | grep -o -P '(?<=h1>).*(?=h1)' | sed 's/<\///g')
#Linha de cima: busca no HTML, a tag referente ao titulo do livro e printa o que está embaixo dela, tira espaços extras, remove tag parcialmente, termina de remover as tags. Td isso respectivamente. Por fim, joga todo esse procedimento numa variável
	echo $TITULO #Print para testar se var deu certo
	cat "livro${CONT}.html" | grep "Download this book" > link_sem_filtro.txt
#Linha de cima: busca no HTML do grupo a tag referente à localização do botão de download da Springer e passa output para um arquivo chama link_sem_filtro.txt
	CAMINHO=$(grep -o -P '(?<=href=").*(?=" target)' link_sem_filtro.txt) #Printa apenas o caminho, que está entre 'href="' e '" target' no sistema e atribui à uma variável caminho
	wget -O "${TITULO}.pdf" "https://link.springer.com${CAMINHO}" #Tendo caminho e título, baixa o livro e nomeia o arquivo baixado como titulo.pdf
	CONT=$[ CONT + 1 ] #Contador para passar de livro por livro
	rm *html #Remove os HTMLs gerados durante o looping
done

rm livros.* #Remove os arquivos que começam com o nome livros
rm *.txt #Remove todos os txts
