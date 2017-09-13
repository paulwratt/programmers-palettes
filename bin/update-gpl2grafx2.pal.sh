#!/bin/sh
if [ "$1" = "" -o "$1" = "--help" ]; then
  echo "gpl2grafx2.pal"
  echo "GiMP color palette (.gpl) to Grafix2 (JASC) color palette  (.txt)"
  echo "usage: gpl2grafx2.pal.sh [--help]|filename.gpl"
  echo "notes: './(basename(pwd)).grafx2-JASC.pal' "
  echo "       will be over written."
  exit 0
fi
if [ ! -f "./$1" ]; then
  echo "Error: not found: './$1'"
  exit 1
fi
if [ ! "`head -n 1 "$1"`" = "GIMP Palette" ]; then
  echo "Error: not a GiMP Palette: './$1'"
  exit 2
fi

BN=`pwd`
BN=`basename "$BN"`
PN=`echo "$BN" | sed 's/HW-//g'`
CN=`grep -c -E "^[\ 0-9]" "$1"`

cat > "${BN}.grafx2-JASC.pal" <<EOF
JASC-PAL
0100
256
EOF

grep -E "^[\ 0-9]" "$1" | cut --output-delimiter=, --characters=1-3,5-7,9-11 | tr -d \  | tr , \  >> "${BN}.grafx2-JASC.pal"

for i in `seq $CN 255`; do
  echo "0 0 0" >> "${BN}.grafx2-JASC.pal"
done

echo "$CN colors written to '${BN}.grafx2-JASC.pal'"

unset CN
unset PN
unset BN
exit 0
