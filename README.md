Bash Media Tagger
===

## Workflow
1. Install [mutagen](https://github.com/quodlibet/mutagen) (under ubuntu install python-mutagen) 
  ```
  sudo apt install python-mutagen
  ```
2. Puth *settags.sh* and *regextest.sh* into your collection root, or part of your collection copyied there for processing.
3. Test the parameters you are going to pass *settags.sh* with *regextest.sh*
  Eg: 
  ```sh
  find ./Cyborgjeff -type f -iname 01*.mp3 -print \
    -exec ./regextest.sh "[/](.*)/([0-9]{4}) (.*)/([0-9]{2}) (.*)\.mp3$" TPE1,TYER,TALB,TRCK,TIT2 "{}" \;
  ```
  this returns:
  ```
  ./Cyborgjeff/2008 Goddess in my Hand/01 Je suis Plug & Play.mp3
	  /Cyborgjeff/2008 Goddess in my Hand/01 Je suis Plug & Play.mp3
  TPE1	Cyborgjeff
  TYER	2008
  TALB	Goddess in my Hand
  TRCK	01
  TIT2	Je suis Plug & Play
```
4. Find media files and launch settags.sh for each one: 
  ```sh
  find Cyborgjeff -type f -name *.mp3 -print \
  -exec ./settags.sh \
    "[/]regex string.mp3$" \
    comma,separted,list,of,frames,corresponding,to,the,regex \
    "{}" additional mid3v2 parameters \;
  ```

## What it does
  For each media file that matches the regex it
  1. Convert id3v1 tags into id3v2 tags.
  2. Clears id3v1 tags.
  3. Set each frame to the corresponding regex group.
  4. Lists set frames.

## Example
```sh
find ./Cyborgjeff -type f -iname 01*.mp3 -print \
  -exec ./settags.sh \
    "[/](.*)/([0-9]{4}) (.*)/([0-9]{2}) (.*)\.mp3$" \
    TPE1,TYER,TALB,TRCK,TIT2 \
  "{}" --COMM "test manually" \;
```
the result:
```
./Cyborgjeff/2008 Goddess in my Hand/01 Je suis Plug & Play.mp3
IDv2 tag info for ./Cyborgjeff/2008 Goddess in my Hand/01 Je suis Plug & Play.mp3 
COMM==eng=test manually
TALB=Goddess in my Hand
TIT2=Je suis Plug & Play
TPE1=Cyborgjeff
TRCK=01
TYER=2008 
```

