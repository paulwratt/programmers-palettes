#!/bin/sh
BN=`pwd`
BN=`basename "$BN"`
if [ "$1" = "" -o "$1" = "--help" ]; then
  echo "gpl2hex24-CAPS-space-txt"
  echo "GiMP color palette (.gpl) to capitalized 24bit RGB hexadecimal space text (.txt)"
  echo "usage: gpl2hex24-CAPS-space-txt.sh [--help]|filename.gpl"
  echo "notes: './$BN-hex-24-CAPS-space.txt' "
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

grep -E "^[\ 0-9]" "$1" | cut --output-delimiter=\  --characters=1-3,5-7,9-11 | xargs printf "%02x %02x %02x\n" | tr [a-f] [A-F] > "${BN}-hex-24-CAPS-space.txt"

unset BN
exit 0
