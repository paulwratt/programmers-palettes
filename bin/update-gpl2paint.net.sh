#!/bin/sh
BN=`pwd`
BN=`basename "$BN"`
if [ "$1" = "" -o "$1" = "--help" ]; then
  echo "gpl2paint.net"
  echo "GiMP color palette (.gpl) to Paint.Net color palette  (.txt)"
  echo "usage: gpl2paint.net.sh [--help]|filename.gpl"
  echo "notes: './$BN.paint.net.txt' "
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

PN=`echo "$BN" | sed 's/HW-//g'`
CN=`grep -c -E "^[\ 0-9]" "$1"`

cat > "${BN}.paint.net.txt" <<EOF
; ${PN} ${CN} color palette (2017) for Paint.Net
; https://github.com/paulwratt/programmers-palettes/docs/${BN}/${BN}.paint.net.txt
; save this to:
;  C:\User\<username>\Documents\paint.net User Files\Palettes\ ${PN}_${CN}.txt
;
EOF

# has color index and name after color number
if [ ! "`grep -P '\t0 - ' "$1"`" = "" ]; then
  grep -E "^[\ 0-9]" "$1" | cut --output-delimiter=\  --characters=1-3,5-7,9-11 | xargs printf "%02x%02x%02x ;\n" > temp.1
  grep -E "^[\ 0-9]" "$1" | cut --output-delimiter=\n  --characters=13- > temp.2
  paste -d\  temp.1 temp.2 >> "${BN}.paint.net.txt"
  rm -f temp.1
  rm -f temp.2
else
  grep -E "^[\ 0-9]" "$1" | cut --output-delimiter=\  --characters=1-3,5-7,9-11 | xargs printf "%02x%02x%02x\n" >> "${BN}.paint.net.txt"
fi

echo "$CN colors written to '${BN}.paint.net.txt'"

unset CN
unset PN
unset BN
exit 0
