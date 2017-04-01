Bash Media Tagger
===
## Workflow
0. Your music collection is expected to be in the following format (from the collection root folder): 
  ```
  ArtistName/Year Album/TrackNum Title.ext
  ``` 
  The current version dies not support alternative paths - issue #1. For such cases you should modify the regex in settags.sh
1. Install [mutagen](https://github.com/quodlibet/mutagen) (under ubuntu install python-mutagen) 
  ```
  sudo apt install python-mutagen
  ```
2. Puth settags.sh into your collection root, or part of your collection copyied there for processing.
3. Find media files and launch settags.sh for each one: 
  ```sh
  find ArtistName -type f -name *.ext -print -exec ./settags.sh "{}" \;
  ```
  ## What it does
  For each media file it
  1. Convert id3v1 tags into id3v2 tags.
  2. Clears id3v1 tags.
  3. Sets Artist, Year, Album, Num, Title
  4. Lists set tags. 
## Example
```sh
find Cyborgjeff -type f -name *.mp3 -print -exec ./settags.sh "{}" \;
```
results:
```
Cyborgjeff/2008 Goddess in my Hand/04 Goddess in my Hands.mp3
IDv2 tag info for Cyborgjeff/2008 Goddess in my Hand/04 Goddess in my Hands.mp3 
APIC= (image/jpeg, 46625 bytes)
COMM==eng=http://www.jamendo.com Attribution-Noncommercial-Share Alike 3.0
COMM=ID3 v1 Comment=eng=Attribution-Noncommercial-Shar
TALB=Goddess in my Hand
TCON=Dance
TCOP=2008-06-03T15:50:01+01:00 Cyborgjeff. Licensed to the public under http://creativecommons.org/licenses/by-nc-sa/3.0/ verify at http://www.jamendo.comalbum/26091/
TDRC=2008
TDRL=2008
TDTG=2012-08-13 09:43:26
TENC=Jamendo : http://www.jamendo.com | LAME
TIT2=Goddess in my Hands
TPE1=Cyborgjeff
TPUB=Jamendo
TRCK=04
WCOM=http://www.jamendo.com
WCOP=http://creativecommons.org/licenses/by-nc-sa/3.0/
WOAF=http://www.jamendo.com/en/track/176091
WOAR=http://www.jamendo.com/en/artist/cyborgjeff
WOAS=http://www.jamendo.com/en/album/26091
WPUB=http://www.jamendo.com 
Cyborgjeff/2008 Goddess in my Hand/01 Je suis Plug & Play.mp3
[...]
WPUB=http://www.jamendo.com 
Cyborgjeff/2008 Goddess in my Hand/02 What is love (kryptonic 2008 no vocal for Jamendo).mp3
IDv2 tag info for Cyborgjeff/2008 Goddess in my Hand/02 What is love (kryptonic 2008 no vocal for Jamendo).mp3 
APIC= (image/jpeg, 46625 bytes)
COMM==eng=http://www.jamendo.com Attribution-Noncommercial-Share Alike 3.0
COMM=ID3 v1 Comment=eng=Attribution-Noncommercial-Shar
TALB=Goddess in my Hand
TCON=Unknown
TCOP=2008-06-03T15:50:01+01:00 Cyborgjeff. Licensed to the public under http://creativecommons.org/licenses/by-nc-sa/3.0/ verify at http://www.jamendo.comalbum/26091/
TDRC=2008
TDRL=2008
TDTG=2012-01-10 07:49:56
TENC=Jamendo : http://www.jamendo.com | LAME
TIT2=What is love (kryptonic 2008 no vocal for Jamendo)
TPE1=Cyborgjeff
TPUB=Jamendo
TRCK=02
WCOM=http://www.jamendo.com
WCOP=http://creativecommons.org/licenses/by-nc-sa/3.0/
WOAF=http://www.jamendo.com/en/track/176093
WOAR=http://www.jamendo.com/en/artist/cyborgjeff
WOAS=http://www.jamendo.com/en/album/26091
WPUB=http://www.jamendo.com 
```
