#!/bin/bash
f="$1"
regex="(.*)/([0-9]{4}) (.*)/([0-9]{2}) (.*)\..*$"
#01      Artist
#02      YYYY
#03      Album
#04      Num
#05      Title
if [[ $f =~ $regex ]]; then
  mid3v2 --convert "$f"
  mid3v2 -s \
    -a "${BASH_REMATCH[1]}" \
    -y "${BASH_REMATCH[2]}" \
    -A "${BASH_REMATCH[3]}" \
    -T "${BASH_REMATCH[4]}" \
    -t "${BASH_REMATCH[5]}" \
  "$f"
  mid3v2 -l "$f"
fi
