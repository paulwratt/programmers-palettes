#!/bin/sh
if [ "$1" = "" -o "$1" = "--help" ]; then
  echo "gpl2hex24-CAPS-forward-slash-txt"
  echo "GiMP color palette (.gpl) to capitalized 24bit RGB hexadecimal forward-slash text (.txt)"
  echo "usage: gpl2hex24-CAPS-forward-slash-txt.sh [--help]|filename.gpl"
  echo "notes: './(basename(pwd))-hex-24-CAPS-forward-slash.txt' "
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

grep -E "^[\ 0-9]" "$1" | cut --output-delimiter=\  --characters=1-3,5-7,9-11 | xargs printf "%02x/%02x/%02x\n" | tr [a-f] [A-F] > "${BN}-hex-24-CAPS-forward-slash.txt"

unset BN
exit 0
