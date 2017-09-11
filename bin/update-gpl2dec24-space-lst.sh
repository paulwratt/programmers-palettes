#!/bin/sh
if [ "$1" = "" -o "$1" = "--help" ]; then
  echo "gpl2dec24-space-lst"
  echo "GiMP color palette (.gpl) to 24bit RGB decimal space aligned text list (.lst)"
  echo "usage: gpl2dec24-space-lst.sh [--help]|filename.gpl"
  echo "notes: './(basename(pwd))-dec-24-space.lst' "
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

grep -E "^[\ 0-9]" "$1" | cut --output-delimiter=\  --characters=1-3,5-7,9-11 > "${BN}-dec-24-space.lst"

unset BN
exit 0
