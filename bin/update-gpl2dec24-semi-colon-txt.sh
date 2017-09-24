#!/bin/sh
BN=`pwd`
BN=`basename "$BN"`
if [ "$1" = "" -o "$1" = "--help" ]; then
  echo "gpl2dec24-semi-colon-txt"
  echo "GiMP color palette (.gpl) to 24bit RGB decimal semi-colon text (.txt)"
  echo "usage: gpl2dec24-semi-colon-txt.sh [--help]|filename.gpl"
  echo "notes: './$BN-dec-24-semi-colon.txt' "
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

grep -E "^[\ 0-9]" "$1" | cut --output-delimiter=\; --characters=1-3,5-7,9-11 | tr -d \ > "${BN}-dec-24-semi-colon.txt"

unset BN
exit 0
