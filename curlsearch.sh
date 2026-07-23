#! /bin/sh

URL=$1
FILE=$(date +%d%m%y)_$(echo "$URL" | sed 's|^http://||; s|^https://||; s|[/:?&=<>]|_|g').html

# get the webpage and store it
curl "$URL" > "$FILE"

# flush the input url from list of arguments
shift

# search for keywords
for term in "$@"; do
    printf " %s " "$term"
    SEARCHFILE=temp_"$term".txt
    grep "$term" "$FILE" > $SEARCHFILE
    printf "%s instances\n" "$(wc -l < "$SEARCHFILE")"
    # optional cleanup to remove text files -- delete if not wanted
    rm "$SEARCHFILE"
done
