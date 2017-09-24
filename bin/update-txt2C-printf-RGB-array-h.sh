#!/bin/sh
BN=`pwd`
BN=`basename "$BN"`
if [ "$1" = "" -o "$1" = "--help" ]; then
  echo "txt2C-printf-RGB-array-h"
  echo "Pre-processed text to C/C++ header printf hexadecimal RGB array (.h)"
  echo "usage: txt2C-printf-RGB-array-h.sh [--help]|[do]"
  echo "notes: './$BN-C-printf-RGB-array.h' "
  echo "       will be over written."
  echo "requires: "
  echo "       './$BN-hex-24-printf-CAPS-RGB888.txt'"
  exit 0
fi
if [ ! "$1" = "do" ]; then
  echo "Error: txt2C-printf-RGB-array-h.sh [--help]|[do]"
  exit 1
fi

# make sure we have all the required files
if [ ! -f "./${BN}-hex-24-printf-CAPS-RGB888.txt" ]; then
  echo "Error: file not found: './${BN}-hex-24-printf-CAPS-RGB888.txt'"
  exit 2
fi

PN=`echo "$BN" | sed 's/HW-//g'`

cat > "./${BN}-C-printf-RGB-array.h" <<EOF
char pcolors${PN}[][12] = 
{

EOF
cat "./${BN}-hex-24-printf-CAPS-RGB888.txt" | sed 's/\(.*\)/\t{ "\1" },/g' >> "./${BN}-C-printf-RGB-array.h"
printf '\t{ "\x0\x0\x0" } // delete this line, and last comma above\n' >> "./${BN}-C-printf-RGB-array.h"
printf '};\n' >> "./${BN}-C-printf-RGB-array.h"

unset PN
unset BN
exit 0
