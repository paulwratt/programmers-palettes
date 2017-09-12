#!/bin/sh
if [ "$1" = "" -o "$1" = "--help" ]; then
  echo "C2C-cNames-printf-RGB-list-h"
  echo "Pre-processed C/C++ headers combined cColorNames and printf hexadecimal RGB list (.h)"
  echo "usage: C2C-cNames-printf-RGB-list-h.sh [--help]|[do]"
  echo "notes: './(basename(pwd))-C-cNames-printf-RGB-list.h' "
  echo "       will be over written."
  exit 0
fi
if [ ! "$1" = "do" ]; then
  echo "Error: C2C-cNames-printf-RGB-list-h.sh [--help]|[do]"
  exit 1
fi
BN=`pwd`
BN=`basename "$BN"`

# make sure we have all the required files
if [ ! -f "./${BN}-C-names-array.h" ]; then
  echo "Error: file not found: '././${BN}-C-names-array.h'"
  exit 2
fi
if [ ! -f "./${BN}-hex-24-printf-CAPS.txt" ]; then
  echo "Error: file not found: '././${BN}-hex-24-printf-CAPS.txt'"
  exit 2
fi

echo "// ${BN}" > "${BN}-C-cNames-printf-RGB-list.h"
LN=`cat "./${BN}-names-cCaps.txt" | wc -L`
cat "./${BN}-names-cCaps.txt" | xargs printf "\t%-${LN}s \n" > temp.1
cat "./${BN}-hex-24-printf-CAPS.txt" | sed 's/\\x/.x/g' | sed 's/\(.*\)/ "\1";/g' > temp.2
paste -d= temp.1 temp.2 > temp.0
cat temp.0 | sed 's/.x/\\x/g' >> "${BN}-C-cNames-printf-RGB-list.h"
rm -f temp.0
rm -f temp.1
rm -f temp.2

unset BN
exit 0
