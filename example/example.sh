URL=https://sheriff.knoxcountytn.gov/ 
FILE=$(date +%d%m%y)_$(echo "$URL" | sed 's|^http://||; s|^https://||; s|[/:?&=<>]|_|g').html

# get the webpage and store it
curl "$URL" > "$FILE"


# search for keywords
