#!/bin/sh
BN=`pwd`
BN=`basename "$BN"`
if [ "$1" = "" -o "$1" = "--help" ]; then
  echo "txt2photoshop.act"
  echo "Pre-processed text (.txt) to Adobe Photoshop color palette  (.act)"
  echo "usage: txt2photoshop.act.sh [--help]|[do]"
  echo "notes: './$BN.photoshop.act' "
  echo "       will be over written."
  echo "requires: "
  echo "       './$BN-dec-24-space.txt'"
  exit 0
fi
if [ ! "$1" = "do" ]; then
  echo "Error: txt2photoshop.act.sh [--help]|[do]"
  exit 1
fi

# make sure we have all the required files
if [ ! -f "./${BN}-dec-24-space.txt" ]; then
  echo "Error: file not found: './${BN}-dec-24-space.txt'"
  exit 2
fi

RD=`dirname $0`
CN=`grep -c -E "^[0-9]" "./${BN}-dec-24-space.txt"`

cat "./${BN}-dec-24-space.txt" | xargs -I {} "$RD/as-RGB-dec-2-bytes.sh" {} > "${BN}.photoshop.act"

for i in `seq $CN 255`; do
  "$RD/as-RGB-dec-2-bytes.sh" 0 0 0 >> "${BN}.photoshop.act"
done
"$RD/as-RGB-dec-2-bytes.sh" $CN 255 255 >> "${BN}.photoshop.act"

echo "$CN colors written to '${BN}.photoshop.act'"

unset CN
unset RD
unset BN
exit 0
