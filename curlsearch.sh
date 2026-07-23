#!/bin/sh

# make sure the user enters at least two arguments
if [ "$#" -lt 2 ]; then
    printf 'Usage: %s URL TERM...\n' "$0" >&2
    exit 1
fi

URL=$1
# generate name for stored HTML file
DAY=$(date +%Y%m%d%H)
FILE="$DAY"_$(printf "%s" "$URL" | sed 's|^http://||; s|^https://||; s|[/:?&=<>]|_|g').html

# get the webpage and store it; exit if it fails
curl -f "$URL" > "$FILE" || { printf "error downloading URL\n"; exit 1; }

# flush the input url from list of arguments
shift

# search for keywords
for term in "$@"; do
    printf " %s " "$term"
    SEARCHFILE=temp_"$term".txt
    grep -n -- "$term" "$FILE" > "$SEARCHFILE"
    printf "%s instances\n" "$(wc -l < "$SEARCHFILE")"
    # optional cleanup to remove text files -- delete if not wanted
    rm -- "$SEARCHFILE"
done
