#!/bin/sh
BN=`pwd`
BN=`basename "$BN"`
if [ "$1" = "" -o "$1" = "--help" ]; then
  echo "gpl2hex24-all-txt"
  echo "GiMP color palette (.gpl) to 24bit RGB hexadecimal space text (.txt)"
  echo "usage: gpl2hex24-all-txt.sh [--help]|filename.gpl"
  echo "notes: the following will be over written, in order"
  echo "       './$BN-hex-24-printf.txt' "
  echo "       './$BN-hex-24-space.txt' "
  echo "       './$BN-hex-24-0x-comma-space.txt' "
  echo "       './$BN-hex-24.txt' "
  echo "       './$BN-hex-24-html.txt' "
  echo "       './$BN-hex-24-html-CAPS.txt' "
  echo "       './$BN-hex-24-CAPS-space.txt' "
  echo "       './$BN-hex-24-CAPS-forward-slash.txt' "
  echo "       './$BN-hex-24-CAPS.txt' "
  echo "       './$BN-hex-24-printf-CAPS-RGB888.txt' "
  echo "       './$BN-hex-32-printf-CAPS-RGBA8888.txt' "
  echo "       './$BN-hex-24-printf-CAPS-BGR888.txt' "
  echo "       './$BN-hex-32-printf-CAPS-BGRA8888.txt' "
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

grep -E "^[\ 0-9]" "$1" | cut --output-delimiter=\  --characters=1-3,5-7,9-11 | xargs printf '\\x%02x\\x%02x\\x%02x\n' > "${BN}-hex-24-printf.txt"
grep -E "^[\ 0-9]" "$1" | cut --output-delimiter=\  --characters=1-3,5-7,9-11 | xargs printf "%02x %02x %02x\n" > "${BN}-hex-24-space.txt"
grep -E "^[\ 0-9]" "$1" | cut --output-delimiter=\  --characters=1-3,5-7,9-11 | xargs printf "0x%02x, 0x%02x, 0x%02x\n" > "${BN}-hex-24-0x-comma-space.txt"
cat "${BN}-hex-24-space.txt" | tr -d \  > "${BN}-hex-24.txt"
cat "${BN}-hex-24.txt" | xargs printf "#%s\n" > "${BN}-hex-24-html.txt"
cat "${BN}-hex-24-html.txt" | tr [a-f] [A-F] > "${BN}-hex-24-html-CAPS.txt"
cat "${BN}-hex-24-space.txt" | tr [a-f] [A-F] > "${BN}-hex-24-CAPS-space.txt"
cat "${BN}-hex-24-space.txt" | tr \  / > "${BN}-hex-24-CAPS-forward-slash.txt"
cat "${BN}-hex-24.txt" | tr [a-f] [A-F] > "${BN}-hex-24-CAPS.txt"
cat "${BN}-hex-24-printf.txt" | tr [a-f] [A-F] > "${BN}-hex-24-printf-CAPS-RGB888.txt"
cat "${BN}-hex-24-printf-CAPS-RGB888.txt" | sed 's/\(.*\)/\1\\x00/g' > "${BN}-hex-32-printf-CAPS-RGBA8888.txt"
cat "${BN}-hex-24-space.txt" | tr [a-f] [A-F] | sed 's/\(.*\)\ \(.*\)\ \(.*\)/\\x\3\\x\2\\x\1/g' > "${BN}-hex-24-printf-CAPS-BGR888.txt"
cat "${BN}-hex-24-space.txt" | tr [a-f] [A-F] | sed 's/\(.*\)\ \(.*\)\ \(.*\)/\\x\3\\x\2\\x\1\\x00/g' > "${BN}-hex-24-printf-CAPS-BGRA8888.txt"

unset BN
exit 0
