#!/bin/sh
if [ "$1" = "" -o "$1" = "--help" ]; then
  echo "gpl2hex24-all-txt"
  echo "GiMP color palette (.gpl) to 24bit RGB hexadecimal space text (.txt)"
  echo "usage: gpl2hex24-all-txt.sh [--help]|filename.gpl"
  echo "notes: the following will be over written, in order"
  echo "       './(basename(pwd))-hex-24-space.txt' "
  echo "       './(basename(pwd))-hex-24.txt' "
  echo "       './(basename(pwd))-hex-24-html.txt' "
  echo "       './(basename(pwd))-hex-24-printf.txt' "
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

grep -E "^[\ 0-9]" "$1" | cut --output-delimiter=\  --characters=1-3,5-7,9-11 | xargs printf "%02x %02x %02x\n" > "${BN}-hex-24-space.txt"
cat "${BN}-hex-24-space.txt" | tr -d \  > "${BN}-hex-24.txt"
cat cat "${BN}-hex-24.txt" | xargs printf "#%s\n" > cat "${BN}-hex-24-html.txt"
grep -E "^[\ 0-9]" "$1" | cut --output-delimiter=\  --characters=1-3,5-7,9-11 | xargs printf "\\x%02x\\x%02x\\x%02x\n" > "${BN}-hex-24-printf.txt"

unset BN
exit 0
