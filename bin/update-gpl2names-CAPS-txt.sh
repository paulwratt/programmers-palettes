#!/bin/sh
if [ "$1" = "" -o "$1" = "--help" ]; then
  echo "gpl2names-CAPS-underscore-txt"
  echo "GiMP color palette (.gpl) to color names CAPS text (.txt)"
  echo "usage: gpl2names-CAPS-txt.sh [--help]|filename.gpl"
  echo "notes: './(basename(pwd))-names-CAPS.txt' "
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

# has color index and name after color number
if [ ! "`grep -P '\t0 - ' "$1"`" = "" ]; then
  grep -E "^[\ 0-9]" "$1" | cut --output-delimiter=\n  --characters=13- | sed 's/ - /,/g' | cut -d \, -f 2 | tr -d \  | tr [a-z] [A-Z] > "${BN}-names-CAPS.txt"
else
  echo "Error: no color names in '$1'"
fi

unset BN
exit 0
