URL=$1
FILE=$(date +%d%m%y)_$(echo "$URL" | sed 's|^http://||; s|^https://||; s|[/:?&=<>]|_|g').html

# get the webpage and store it
curl $URL > $FILE

# flush the input url from list of arguments
shift

# search for keywords
for term in "$@"; do
    printf " %s " "$term"
    SEARCHFILE=temp_"$term".txt
    grep "$term" "$FILE" > $SEARCHFILE
    echo -n $(cat "$SEARCHFILE" | wc -l); echo " instances"
    # optional cleanup to remove text files -- delete if not wanted
    rm temp_"$term".txt
done
