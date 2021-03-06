#!/bin/sh
BN=`pwd`
BN=`basename "$BN"`
if [ "$1" = "" -o "$1" = "--help" ]; then
  echo "txt2xterm.colors"
  echo "Pre-processed text (.txt) to ShellBASIC (bas) color palettes  (.sh)"
  echo "usage: txt2xterm.colors.sh [--help]|[do]"
  echo "notes: './$BN.xterm.colors.sh' "
  echo "       will be over written."
  echo "requires: "
  echo "       './$BN-names-CAPS_.txt'"
  echo "       './$BN-hex-24-CAPS-forward-slash.txt'"
  exit 0
fi
if [ ! "$1" = "do" ]; then
  echo "Error: txt2xterm.colors.sh [--help]|[do]"
  exit 1
fi

# make sure we have all the required files
if [ ! -f "./${BN}-names-CAPS_.txt" ]; then
  echo "Error: file not found: './${BN}-names-CAPS_.txt'"
  exit 2
fi
if [ ! -f "./${BN}-hex-24-CAPS-forward-slash.txt" ]; then
  echo "Error: file not found: './${BN}-hex-24-CAPS-forward-slash.txt'"
  exit 2
fi

PN=`echo "$BN" | sed 's/HW-//g'`
CN=`grep -c -E "^[0-9A-F]" "./${BN}-hex-24-CAPS-forward-slash.txt"`

### xterm printf ESC colors
cat > "./${BN}.xterm.${CN}colors.0" <<EOF
#!/bin/sh
# generated by:
#  programmers-palettes
#  txt2xterm.colors.sh
#  https://github.com/paulwratt/programmers-palettes/tree/master/bin

if echo "\$TERM" | grep "xterm" > /dev/null; then
    # $PN $CN color palette
    t_SETCOLOR='\033]4;%d;rgb:%s';  # for printf
    # xterm-color256: xterm screen rxvt urxtv gnome lxterminal tmux
    # xterm uses hexidecimal values in tput/ESC codes for 256 colors
EOF
echo "t_COLOR0" > ./temp.20
for i in `seq 1 ${CN}`; do
  if [ $i -ne $CN ]; then
    echo "t_COLOR$i" >> ./temp.20
  fi
done
cat "./${BN}-hex-24-CAPS-forward-slash.txt" | xargs printf "::%s::;\n" > ./temp.21
paste -d= ./temp.20 ./temp.21 > ./temp.22
cat "./${BN}-names-CAPS_.txt" | xargs printf 't_%s\n' > ./temp.23
paste -d= ./temp.23 ./temp.21 > ./temp.24
paste -d\  ./temp.22 ./temp.24 > ./temp.25
cat ./temp.25 | xargs printf '    %-30s%s\n' > ./temp.2
cat ./temp.2 >> "./${BN}.xterm.${CN}colors.0"

### the end
echo "fi" >> "./${BN}.xterm.${CN}colors.0"

cat "./${BN}.xterm.${CN}colors.0" | sed 's/::/\"/g' > "${BN}.xterm.${CN}colors.sh"
rm -f ./temp.*
rm -f "./${BN}.xterm.${CN}colors.0"

echo "$CN colors written to '${BN}.xterm.${CN}colors.sh'"

unset CN
unset PN
unset BN
exit 0


