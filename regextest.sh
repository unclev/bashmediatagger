#!/bin/bash
f="$3"
regex="$1"
IFS=',' read -ra TAGS <<< ",$2"
i=-1
if [[ $f =~ $regex ]]; then
  for res in "${BASH_REMATCH[@]}"
  do
     ((i++))
     printf "%s\t%s\n" "${TAGS[i]}" "${res}"
  done
fi

