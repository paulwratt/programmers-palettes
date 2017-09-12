#!/bin/sh
if [ "$1" = "" -o "$1" = "--help" ]; then
  echo "txt2C-printf-RGB-array-h"
  echo "Pre-processed text to C/C++ header printf hexadecimal RGB array (.h)"
  echo "usage: txt2C-printf-RGB-array-h.sh [--help]|[do]"
  echo "notes: './(basename(pwd))-C-printf-RGB-array.h' "
  echo "       will be over written."
  exit 0
fi
if [ ! "$1" = "do" ]; then
  echo "Error: txt2C-printf-RGB-array-h.sh [--help]|[do]"
  exit 1
fi
BN=`pwd`
BN=`basename "$BN"`
PN=`echo "$BN" | sed 's/HW-//g'`

# make sure we have all the required files
if [ ! -f "./${BN}-hex-24-printf-CAPS.txt" ]; then
  echo "Error: file not found: './${BN}-hex-24-printf-CAPS.txt'"
  exit 2
fi

cat > "./${BN}-C-printf-RGB-array.h" <<EOF
char pcolors${PN}[][12] = 
{

EOF
cat "./${BN}-hex-24-printf-CAPS.txt" | sed 's/\(.*\)/\t{ "\1" },/g' >> "./${BN}-C-printf-RGB-array.h"
printf '\t{ "\x0\x0\x0" } // delete this line, and last comma above\n' >> "./${BN}-C-printf-RGB-array.h"
printf '};\n' >> "./${BN}-C-printf-RGB-array.h"

unset PN
unset BN
exit 0
