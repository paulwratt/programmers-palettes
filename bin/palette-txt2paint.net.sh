#!/bin/sh
BN=`pwd`
BN=`basename "$BN"`
if [ "$1" = "" -o "$1" = "--help" ]; then
  echo "txt2paint.net"
  echo "Pre-processed text (.txt) to Paint.Net color palette  (.txt)"
  echo "usage: txt2paint.net.sh [--help]|[do]"
  echo "notes: './$BN.paint.net.txt' "
  echo "       will be over written."
  echo "requires: "
  echo "       './$BN-hex-24.txt'"
  echo "       './$BN-names.lst'"
  exit 0
fi
if [ ! "$1" = "do" ]; then
  echo "Error: palette-txt2paint.net.sh [--help]|[do]"
  exit 1
fi

# make sure we have all the required files
if [ ! -f "./${BN}-hex-24.txt" ]; then
  echo "Error: file not found: './${BN}-hex-24.txt'"
  exit 2
fi
if [ ! -f "./${BN}-names.lst" ]; then
  echo "Error: file not found: './${BN}-names.lst'"
  exit 2
fi

PN=`echo "$BN" | sed 's/HW-//g'`
CN=`grep -c -E "^[0-9a-f]" "./${BN}-hex-24.txt"`

cat > "${BN}.paint.net.txt" <<EOF
; ${PN} ${CN} color palette (2017) for Paint.Net
; https://github.com/paulwratt/programmers-palettes/docs/${BN}/${BN}.paint.net.txt
; save this to:
;  C:\User\<username>\Documents\paint.net User Files\Palettes\ ${PN}_${CN}.txt
;
EOF

# has color index and name after color number
for I in `seq 1 $CN`; do
  J=`cat "./${BN}-hex-24.txt" | head -n $I | tail -n 1`
  K=`cat "./${BN}-names.lst" | head -n $I | tail -n 1`
  echo  "$J ; $K" >> "${BN}.paint.net.txt"
done

echo "$CN colors written to '${BN}.paint.net.txt'"

unset CN
unset PN
unset BN
exit 0
