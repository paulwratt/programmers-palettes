#!/bin/sh
if [ "$1" = "" -o "$1" = "--help" ]; then
  echo "txt2C-hex-RGB-array-h"
  echo "Pre-processed text to C/C++ header hexadecimal comma space seperated RGB array (.h)"
  echo "usage: txt2C-hex-RGB-array-h.sh [--help]|[do]"
  echo "notes: './(basename(pwd))-C-hex-RGB-array.h' "
  echo "       will be over written."
  exit 0
fi
if [ ! "$1" = "do" ]; then
  echo "Error: txt2C-hex-RGB-array-h.sh [--help]|[do]"
  exit 1
fi
BN=`pwd`
BN=`basename "$BN"`
PN=`echo "$BN" | sed 's/HW-//g'`

# make sure we have all the required files
if [ ! -f "./${BN}-hex-24-0x-comma-space.txt" ]; then
  echo "Error: file not found: './${BN}-hex-24-0x-comma-space.txt'"
  exit 2
fi

cat > "./${BN}-C-hex-RGB-array.h" <<EOF
char hcolors${PN}[][3] = 
{

EOF
cat "./${BN}-hex-24-0x-comma-space.txt" | sed 's/\(.*\)/\t{ \1 },/g' >> "./${BN}-C-hex-RGB-array.h"
printf '\t{ 0,0,0 } // delete this line, and last comma above\n' >> "./${BN}-C-hex-RGB-array.h"
printf '};\n' >> "./${BN}-C-hex-RGB-array.h"

unset PN
unset BN
exit 0
