#!/bin/bash

#Create and access the directory "Books"
mkdir Books
cd Books

#Download one of the pages in order to count the pages
wget -O "num_pages.html" "https://link.springer.com/search/page/1?facet-content-type=%22Book%22&package=mat-covid19_textbooks"

#Scrap the downloaded page to obtain the number of all free ebooks available
TOTAL_BOOKS=$(sed -n '/number-of-search-results/{n;p}' "num_pages.html" | sed 's/  \+//g' | grep -oP '(?<=strong>).*(?=strong)' | sed 's/<\///g')
#Number to run all pages
CURRENT_PAGE=1
#Counting how many books per page
BPP=$(cat "num_pages.html" | grep 'class="title"' | sed 's/  \+//g' | grep -oP '(?<=href=").*(?=" title)' | sed 's/\/book/https\:\/\/link\.springer\.com/g' | grep -c http)
echo $BPP

#Conditional that will assure that all pages will be accessed. If the remaider of the division is zero, then number os pages = all_books/10
if [[ $[ $TOTAL_BOOKS % $BPP ] -eq 0 ]];then
	MAX_PAGE=$[ $TOTAL_BOOKS / $BPP ]
else #If remaider isn't zero, then, probably, there'll be an extra page, then, pages = (all_books/10) + 1
	MAX_PAGE=$[ $[ $TOTAL_BOOKS / $BPP ] + 1 ]
fi

#Loop that will obtain all URLs and store them in a text file. Also it's worth noting that all pages will be accessed and scraped for the URLs
while [[ $CURRENT_PAGE -le $MAX_PAGE ]]; do
	wget -O "books(${CURRENT_PAGE}).html" "https://link.springer.com/search/page/${CURRENT_PAGE}?facet-content-type=%22Book%22&package=mat-covid19_textbooks"
	cat "books(${CURRENT_PAGE}).html" | grep 'class="title"' | sed 's/  \+//g' | grep -oP '(?<=href=").*(?=" title)' | sed 's/\/book/https\:\/\/link\.springer\.com/g' >> books.txt
	CURRENT_PAGE=$[ $CURRENT_PAGE + 1 ]
done

#Array that will receive all the URLs stored in the text file
URL=($(cat books.txt | sed -z 's/\n/ /g'))
#Index that will run all the array elements
INDEX=0

while [[ $INDEX -lt $[ ${#URL[@]} - 1 ] ]]; do

#Downloading the book download pages
	wget -O "book${INDEX}.html" "${URL[${INDEX}]}"
#Scraping pages for obtaining and handling all URLs for downloading
	DL_URL=$(cat "book${INDEX}.html" | grep -m 1 "Download this book in PDF" | grep -oP '(?<=href=").*(?=" title)' | sed 's/\/content/https\:\/\/link\.springer\.com\/content/g')
#Scraping pages for obtaining all the book titles
	TITULO=$(sed -n '/book-title/{n;p}' "book${INDEX}.html" | sed 's/  \+//g' | grep -oP '(?<=h1>).*(?=h1>)' | sed 's/<\///g')
#Downloading all pages
	wget -O "${TITULO}.pdf" "${DL_URL}"
	INDEX=$[ $INDEX + 1 ]
	echo ""
done

#Cleaning all temporary files
rm *html
rm *txt
