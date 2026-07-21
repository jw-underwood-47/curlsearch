URL=$1
FILE=$2_$(date +%d%m%y).html

# get the webpage and store it
curl $URL > $FILE


# search for keywords
