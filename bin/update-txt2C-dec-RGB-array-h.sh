#!/bin/sh
if [ "$1" = "" -o "$1" = "--help" ]; then
  echo "txt2C-dec-RGB-array-h"
  echo "Pre-processed text to C/C++ header decimal comma space seperated RGB array (.h)"
  echo "usage: txt2C-dec-RGB-array-h.sh [--help]|[do]"
  echo "notes: './(basename(pwd))-C-dec-RGB-array.h' "
  echo "       will be over written."
  exit 0
fi
if [ ! "$1" = "do" ]; then
  echo "Error: txt2C-dec-RGB-array-h.sh [--help]|[do]"
  exit 1
fi
BN=`pwd`
BN=`basename "$BN"`
PN=`echo "$BN" | sed 's/HW-//g'`

# make sure we have all the required files
if [ ! -f "./${BN}-dec-24-comma-space.txt" ]; then
  echo "Error: file not found: './${BN}-dec-24-comma-space.txt'"
  exit 2
fi

cat > "./${BN}-C-dec-RGB-array.h" <<EOF
char dcolors${PN}[][3] = 
{

EOF
cat "./${BN}-dec-24-comma-space.txt" | sed 's/\(.*\)/\t{ \1 },/g' >> "./${BN}-C-dec-RGB-array.h"
printf '\t{ 0,0,0 } // delete this line, and last comma above\n' >> "./${BN}-C-dec-RGB-array.h"
printf '};\n' >> "./${BN}-C-dec-RGB-array.h"

unset PN
unset BN
exit 0
