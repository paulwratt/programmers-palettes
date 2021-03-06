#!/bin/sh
BN=`pwd`
BN=`basename "$BN"`
if [ "$1" = "" -o "$1" = "--help" ]; then
  echo "txt2C-all-h"
  echo "Pre-processed text files to C/C++ header files (.h)"
  echo "usage: txt2C-all-h.sh [--help]|[do]"
  echo "notes: the following will be over written, in order"
  echo "       './$BN-C-names-array.h'"
  echo "       './$BN-C-dec-RGB-array.h'"
  echo "       './$BN-C-hex-RGB-array.h'"
  echo "       './$BN-C-printf-RGB-array.h'"
  echo "       './$BN-C-names-dec-RGB-arrays.h'"
  echo "       './$BN-C-names-hex-RGB-arrays.h'"
  echo "       './$BN-C-cNames-printf-RGB-list.h'"
  echo "requires: "
  echo "       './$BN-names-official.txt'"
  echo "       './$BN-names-cCaps.txt'"
  echo "       './$BN-dec-24-comma-space.txt'"
  echo "       './$BN-hex-24-0x-comma-space.txt'"
  echo "       './$BN-hex-24-printf-CAPS-RGB888.txt'"
  exit 0
fi
if [ ! "$1" = "do" ]; then
  echo "Error: txt2C-all-h.sh [--help]|[do]"
  exit 1
fi

# make sure we have all the required files
if [ ! -f "./${BN}-names-official.txt" ]; then
  echo "Error: file not found: './${BN}-names-official.txt'"
  exit 2
fi
if [ ! -f "./${BN}-names-cCaps.txt" ]; then
  echo "Error: file not found: './${BN}-names-cCaps.txt'"
  exit 2
fi
if [ ! -f "./${BN}-dec-24-comma-space.txt" ]; then
  echo "Error: file not found: './${BN}-dec-24-comma-space.txt'"
  exit 2
fi
if [ ! -f "./${BN}-hex-24-0x-comma-space.txt" ]; then
  echo "Error: file not found: './${BN}-hex-24-0x-comma-space.txt'"
  exit 2
fi
if [ ! -f "./${BN}-hex-24-printf-CAPS-RGB888.txt" ]; then
  echo "Error: file not found: './${BN}-hex-24-printf-CAPS-RGB888.txt'"
  exit 2
fi

PN=`echo "$BN" | sed 's/HW-//g'`
LN=`cat "./${BN}-names-official.txt" | wc -L`

### "./_set_-C-names-array.h"
cat > "./${BN}-C-names-array.h" <<EOF
// the length of the longest color name
#define ${PN}_NAMES_MAX=${LN}

char names${PN}[][${PN}_NAMES_MAX] = 
{
EOF
cat "./${BN}-names-official.txt" | sed 's/\(.*\)/\t{ "\1" },/g' >> "./${BN}-C-names-array.h"
printf '\t{ "" } // delete this line, and last comma above\n' >> "./${BN}-C-names-array.h"
printf '};\n' >> "./${BN}-C-names-array.h"


### "./_set_-C-dec-RGB-array.h"
cat > "./${BN}-C-dec-RGB-array.h" <<EOF
char dcolors${PN}[][3] = 
{
EOF
cat "./${BN}-dec-24-comma-space.txt" | sed 's/\(.*\)/\t{ \1 },/g' >> "./${BN}-C-dec-RGB-array.h"
printf '\t{ 0,0,0 } // delete this line, and comma last above\n' >> "./${BN}-C-dec-RGB-array.h"
printf '};\n' >> "./${BN}-C-dec-RGB-array.h"


### "./_set_-C-hex-RGB-array.h"
cat > "./${BN}-C-hex-RGB-array.h" <<EOF
char hcolors${PN}[][3] = 
{

EOF
cat "./${BN}-hex-24-0x-comma-space.txt" | sed 's/\(.*\)/\t{ \1 },/g' >> "./${BN}-C-hex-RGB-array.h"
printf '\t{ 0,0,0 } // delete this line, and last comma above\n' >> "./${BN}-C-hex-RGB-array.h"
printf '};\n' >> "./${BN}-C-hex-RGB-array.h"


### "./_set_-C-printf-RGB-array.h"
cat > "./${BN}-C-printf-RGB-array.h" <<EOF
char pcolors${PN}[][12] = 
{

EOF
cat "./${BN}-hex-24-printf-CAPS-RGB888.txt" | sed 's/\(.*\)/\t{ "\1" },/g' >> "./${BN}-C-printf-RGB-array.h"
printf '\t{ "\x0\x0\x0" } // delete this line, and last comma above\n' >> "./${BN}-C-printf-RGB-array.h"
printf '};\n' >> "./${BN}-C-printf-RGB-array.h"


### "./_set_-C-names-dec-RGB-arrays.h"
cat "./${BN}-C-names-array.h" > "./${BN}-C-names-dec-RGB-arrays.h"
echo "" >> "./${BN}-C-names-dec-RGB-arrays.h"
cat "./${BN}-C-dec-RGB-array.h" >> "./${BN}-C-names-dec-RGB-arrays.h"


### "./_set_-C-names-hex-RGB-arrays.h"
cat "./${BN}-C-names-array.h" > "./${BN}-C-names-hex-RGB-arrays.h"
echo "" >> "./${BN}-C-names-hex-RGB-arrays.h"
cat "./${BN}-C-hex-RGB-array.h" >> "./${BN}-C-names-hex-RGB-arrays.h"


### "./_set_-C-cNames-printf-RGB-list.h"
echo "// ${BN}" > "${BN}-C-cNames-printf-RGB-list.h"
LN=`cat "./${BN}-names-cCaps.txt" | wc -L`
cat "./${BN}-names-cCaps.txt" | xargs printf "\t%-${LN}s \n" > temp.1
cat "./${BN}-hex-24-printf-CAPS-RGB888.txt" | sed 's/\\x/.x/g' | sed 's/\(.*\)/ "\1";/g' > temp.2
paste -d= temp.1 temp.2 > temp.0
cat temp.0 | sed 's/.x/\\x/g' >> "${BN}-C-cNames-printf-RGB-list.h"
rm -f temp.0
rm -f temp.1
rm -f temp.2


unset LN
unset PN
unset BN
exit 0
