#!/bin/sh
if [ "$1" = "" -o "$1" = "--help" ]; then
  echo "gpl2names-lst"
  echo "GiMP color palette (.gpl) to color names text (.lst)"
  echo "usage: gpl2names-lst.sh [--help]|filename.gpl"
  echo "notes: './(basename(pwd))-names.lst' "
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

  grep -E "^[\ 0-9]" "$1" | cut --output-delimiter=\n  --characters=13- > "${BN}-names.lst"

else
  echo "Error: no color names in '$1'"
fi

unset BN
exit 0
