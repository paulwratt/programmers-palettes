#!/bin/sh
if [ "$1" = "" -o "$1" = "--help" ]; then
  echo "gpl2names-all-txt"
  echo "GiMP color palette (.gpl) to names text files (.txt)"
  echo "usage: gpl2names-all-txt.sh [--help]|filename.gpl"
  echo "notes: the following will be over written, in order"
  echo "       './(basename(pwd))-names.lst'"
  echo "       './(basename(pwd))-names-official.txt'"
  echo "       './(basename(pwd))-names-lower_.txt'"
  echo "       './(basename(pwd))-names-CAPS_.txt'"
  echo "       './(basename(pwd))-names-CAPS.txt'"
  echo "       './(basename(pwd))-names-Caps-space.txt'"
  echo "       './(basename(pwd))-names-cCaps.txt'"
  exit 0
fi
if [ ! -f "./$1" ]; then
  echo "Error: not found: './$1'"
  exit 1
fi
if [ ! "`head -n 1 "$1"`" = "GIMP Palette" ]; then
  echo "Error: not a GiMP Palette: './$1'"
  exit 2
fi
BN=`pwd`
BN=`basename "$BN"`
RD=`dirname $0`

# has color index and name after color number
if [ ! "`grep -P '\t0 - ' "$1"`" = "" ]; then

  grep -E "^[\ 0-9]" "$1" | cut --output-delimiter=\n  --characters=13- > "${BN}-names.lst"
  cat "${BN}-names.lst" | sed 's/ - /,/g' | cut -d \, -f 2 | tr [A-Z] [a-z] > "${BN}-names-official.txt"
  cat "${BN}-names-official.txt" | tr \  _ > "${BN}-names_lower_.txt"
  cat "${BN}-names-lower_.txt" | tr [a-z] [A-Z] > "${BN}-names-CAPS_.txt"
  cat "${BN}-names-CAPS_.txt" | tr -d _ > "${BN}-names-CAPS.txt"
  cat "${BN}-names-official.txt" | xargs -I {} $RD/as-capitalised-words.sh {} > "${BN}-names-Caps-space.txt"
  cat "${BN}-names-Caps-space.txt" | tr -d \  | xargs -I {} echo "c{}" "${BN}-names-cCaps.txt"

else
  echo "Error: no color names in '$1'"
fi

unset RD
unset BN
exit 0
