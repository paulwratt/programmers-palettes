#!/bin/sh
if [ "$1" = "" -o "$1" = "--help" ]; then
  echo "gpl2dec24-all-txt"
  echo "GiMP color palette (.gpl) to 24bit RGB decimal text files (.txt)"
  echo "usage: gpl2dec24-all-txt.sh [--help]|filename.gpl"
  echo "notes: the following will be over written, in order"
  echo "       './(basename(pwd))-dec-24-space-comma.txt'"
  echo "       './(basename(pwd))-dec-24-comma.txt'"
  echo "       './(basename(pwd))-dec-24-comma-space.txt'"
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

grep -E "^[\ 0-9]" "$1" | cut --output-delimiter=, --characters=1-3,5-7,9-11 > "${BN}-dec-24-space-comma.txt"
cat "${BN}-dec-24-space-comma.txt" | tr -d \ > "${BN}-dec-24-comma.txt"
cat "${BN}-dec-24-comma.txt" | sed 's/,/, /g' > "${BN}-dec-24-comma-space.txt"
cat "${BN}-dec-24-comma.txt" | tr , \  > "${BN}-dec-24-space.txt"

unset BN
exit 0