#!/bin/sh
if [ "$1" = "" -o "$1" = "--help" ]; then
  echo "C2C-names-hex-RGB-arrays-h"
  echo "Pre-processed C/C++ headers combined names and hexadecimal RGB arrays (.h)"
  echo "usage: C2C-names-hex-RGB-arrays-h.sh [--help]|[do]"
  echo "notes: './(basename(pwd))-C-names-hex-RGB-arrays.h' "
  echo "       will be over written."
  exit 0
fi
if [ ! "$1" = "do" ]; then
  echo "Error: C2C-names-hex-RGB-arrays-h.sh [--help]|[do]"
  exit 1
fi
BN=`pwd`
BN=`basename "$BN"`

# make sure we have all the required files
if [ ! -f "./${BN}-C-names-array.h" ]; then
  echo "Error: file not found: '././${BN}-C-names-array.h'"
  exit 2
fi
if [ ! -f "./${BN}-C-dec-RGB-array.h" ]; then
  echo "Error: file not found: '././${BN}-C-hex-RGB-array.h'"
  exit 2
fi

cat "./${BN}-C-names-array.h" > "./${BN}-C-names-hex-RGB-arrays.h"
echo "" >> "./${BN}-C-names-hex-RGB-arrays.h"
cat "./${BN}-C-hex-RGB-array.h" >> "./${BN}-C-names-hex-RGB-arrays.h"

unset BN
exit 0
