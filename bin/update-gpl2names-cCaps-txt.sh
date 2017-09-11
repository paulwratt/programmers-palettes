#!/bin/sh
if [ "$1" = "" -o "$1" = "--help" ]; then
  echo "gpl2names-cCaps-txt"
  echo "GiMP color palette (.gpl) to cCapitalized official color names text (.txt)"
  echo "usage: gpl2names-cCaps-txt.sh [--help]|filename.gpl"
  echo "notes: './(basename(pwd))-names-cCaps.txt' "
  echo "       will be over written."
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

  grep -E "^[\ 0-9]" "$1" | cut --output-delimiter=\n  --characters=13- | sed 's/ - /,/g' | cut -d \, -f 2 | tr [A-Z] [a-z] | xargs -I {} $RD/as-capitalised-words.sh {} | tr -d \  | xargs -I {} echo "c{}" > "${BN}-names-cCaps.txt"

else
  echo "Error: no color names in '$1'"
fi

unset RD
unset BN
exit 0
