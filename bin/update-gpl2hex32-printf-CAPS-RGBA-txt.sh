#!/bin/sh
if [ "$1" = "" -o "$1" = "--help" ]; then
  echo "gpl2hex32-printf-CAPS-RGBA-txt"
  echo "GiMP color palette (.gpl) to captialized 32bit RGBA hexadecimal printf text (.txt)"
  echo "usage: gpl2hex32-printf-CAPS-RGBA-txt.sh [--help]|filename.gpl"
  echo "notes: './(basename(pwd))-hex-32-printf-CAPS-RGBA8888.txt' "
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

grep -E "^[\ 0-9]" "$1" | cut --output-delimiter=\  --characters=1-3,5-7,9-11 | xargs printf '\\x%02x\\x%02x\\x%02x\\x00\n' | tr [a-f] [A-F] > "${BN}-hex-32-printf-CAPS-RGBA8888.txt"

unset BN
exit 0