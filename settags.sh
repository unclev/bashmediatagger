#!/bin/bash
#TPE1    Artist
#TYER    YYYY
#TALB    Album
#TRCK    TrackNum
#TIT2    Title

f="$3"
regex="$1"
IFS=',' read -ra TAGS <<< "$2"
i=0
v=1
ARGS=()
if [[ $f =~ $regex ]]; then
  for tag in "${TAGS[@]}"
  do
    ARGS[i]="--${tag}"
    ARGS[i+1]="${BASH_REMATCH[v]}"
    ((i=i+2))
    ((v++))
  done
  if [[ -n "$4" ]];then
    a=0
    for arg in "$@"
    do      
      if [[ "$((++a))" -lt "4" ]]; then
        continue
      fi
      ARGS[i]="$arg"
      ((++i))
    done 
  fi
  mid3v2 --convert "$f"
  mid3v2 -s "${ARGS[@]}"  "$f"
  mid3v2 -l "$f"
fi

