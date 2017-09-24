#!/bin/sh
BN=`pwd`
BN=`basename "$BN"`
if [ "$1" = "" -o "$1" = "--help" ]; then
  echo "txt2C-names-array-h"
  echo "Pre-processed text names to C/C++ header names array (.h)"
  echo "usage: txt2C-names-array-h.sh [--help]|[do]"
  echo "notes: './(basename(pwd))-C-names-array.h' "
  echo "       will be over written."
  echo "requires: "
  echo "       './$BN-names-official.txt'"
  exit 0
fi
if [ ! "$1" = "do" ]; then
  echo "Error: txt2C-names-array-h.sh [--help]|[do]"
  exit 1
fi

# make sure we have all the required files
if [ ! -f "./${BN}-names-official.txt" ]; then
  echo "Error: file not found: './${BN}-names-official.txt'"
  exit 2
fi

PN=`echo "$BN" | sed 's/HW-//g'`
LN=`cat "./${BN}-names-official.txt" | wc -L`

cat > "./${BN}-C-names-array.h" <<EOF
// the length of the longest color name
#define ${PN}_NAMES_MAX=${LN}

char names${PN}[][${PN}_NAMES_MAX] = 
{

EOF
cat "./${BN}-names-official.txt" | sed 's/\(.*\)/\t{ "\1" },/g' >> "./${BN}-C-names-array.h"
printf '\t{ "" } // delete this line, and comma last above\n' >> "./${BN}-C-names-array.h"
printf '};\n' >> "./${BN}-C-names-array.h"

unset LN
unset PN
unset BN
exit 0
