URL=https://sheriff.knoxcountytn.gov/ 
FILE=website_$(date +%d%m%y).html

# get the webpage and store it
curl $URL > $FILE


# search for keywords
