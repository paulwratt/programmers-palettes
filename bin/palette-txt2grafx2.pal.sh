#!/bin/sh
BN=`pwd`
BN=`basename "$BN"`
if [ "$1" = "" -o "$1" = "--help" ]; then
  echo "txt2grafx2.pal"
  echo "Pre-processed text (.txt) to Grafix2 (JASC) color palette  (.txt)"
  echo "usage: txt2grafx2.pal.sh [--help]|[do]"
  echo "notes: './$BN.grafx2.JASC.pal' "
  echo "       will be over written."
  echo "requires:"
  echo "       './$BN-dec-24-space.txt'"
  exit 0
fi
if [ ! "$1" = "do" ]; then
  echo "Error: palette-txt2grafx2.pal.sh [--help]|[do]"
  exit 1
fi

# make sure we have all the required files
if [ ! -f "./${BN}-dec-24-space.txt" ]; then
  echo "Error: file not found: './${BN}-dec-24-space.txt'"
  exit 2
fi

PN=`echo "$BN" | sed 's/HW-//g'`
CN=`grep -c -E "^[0-9]" "./${BN}-dec-24-space.txt"`

cat > "${BN}.grafx2.JASC.pal" <<EOF
JASC-PAL
0100
256
EOF

cat "./${BN}-dec-24-space.txt"  >> "${BN}.grafx2.JASC.pal"

for i in `seq $CN 255`; do
  echo "0 0 0" >> "${BN}.grafx2.JASC.pal"
done

echo "$CN colors written to '${BN}.grafx2.JASC.pal'"

unset CN
unset PN
unset BN
exit 0
