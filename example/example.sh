URL=https://sheriff.knoxcountytn.gov/ 
DAY=$(date +%Y%m%d%H)
FILE="$DAY"_$(printf "%s" "$URL" | sed 's|^http://||; s|^https://||; s|[/:?&=<>]|_|g').html

# get the webpage and store it
curl "$URL" > "$FILE"


# search for keywords
SEARCHFILE=holds.txt
grep -i "HOLD" "$FILE" > $SEARCHFILE
printf "%s instances\n" "$(wc -l < "$SEARCHFILE")"
# optional cleanup to remove text files -- delete if not wanted
rm -- "$SEARCHFILE"
