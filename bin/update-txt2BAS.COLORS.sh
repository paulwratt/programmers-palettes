#!/bin/sh
if [ "$1" = "" -o "$1" = "--help" ]; then
  echo "txt2BAS.COLORS"
  echo "Pre-processed text (.txt) to ShellBASIC (bas) color palettes  (.sh)"
  echo "usage: txt2BAS.COLORS.sh [--help]|[do]"
  echo "notes: './(basename(pwd)).BAS.COLORS' "
  echo "       will be over written."
  exit 0
fi
if [ ! "$1" = "do" ]; then
  echo "Error: txt2BAS.COLORS.sh [--help]|[do]"
  exit 1
fi
BN=`pwd`
BN=`basename "$BN"`
PN=`echo "$BN" | sed 's/HW-//g'`

# make sure we have all the required files
if [ ! -f "./${BN}-names-CAPS_.txt" ]; then
  echo "Error: file not found: '././${BN}-names-CAPS_.txt'"
  exit 2
fi
if [ ! -f "./${BN}-dec-24-space-BGR888.txt" ]; then
  echo "Error: file not found: '././${BN}-dec-24-space-BGR888.txt'"
  exit 2
fi
if [ ! -f "./${BN}-dec-24-semi-colon.txt" ]; then
  echo "Error: file not found: '././${BN}-dec-24-semi-colon.txt'"
  exit 2
fi
if [ ! -f "./${BN}-hex-24-CAPS-forward-slash.txt" ]; then
  echo "Error: file not found: '././${BN}-hex-24-forward-slash.txt'"
  exit 2
fi

CN=`grep -c -E "^[0-9]" "${BN}-dec-24-semi-colon.txt"`

### setup and check
cat > "./${BN}.BAS.COLORS.0" <<EOF
#!/bin/sh
. .SETUP
if [ "\$basCOLORS_DONE" = "1" ]; then
if [ "\$BASIC_COLORS" = "" ]; then

    # (MSX) colors in BAS remap setaf/setab to setf/setb order
    #       this means # order of 1st 16: t_COLORs != fb_COLORs
    #         static int map[8]={ 0,4,2,6,1,5,3,7 };

    # NOTE: sometimes you need screen colors AND actual colors
    #       color numbers should match ~/.bashrc
    #       color names are HTML names, plus some extras (eg BROWN)
    #       fb_COLORs are poked directly in to framebuffer using dd
    #       t_COLORs can be passed through: set 256 color tput/ESC code
    #       remember 2nd 8 t_COLORs are 1st 8 t_COLORs + bold/bright

    # these are RPi HDMI BGRA order framebuffer RGB values (A=ALPHA)
EOF

### framebuffer BGR888 printf colors
echo "t_COLOR0" > ./temp.00
for i in `seq 1 ${CN}`; do
  if [ $i -ne $CN ]; then
    echo "t_COLOR$i" >> ./temp.00
  fi
done
cat "./${BN}-dec-24-space-BGR888.txt" | tr \  , | xargs printf "::%s::;\n" > ./temp.01
paste -d= ./temp.00 ./temp.01 > ./temp.02
cat "./${BN}-names-CAPS_.txt" | xargs printf 't_%s\n' > ./temp.03
paste -d= ./temp.03 ./temp.01 > ./temp.04
paste -d\  ./temp.02 ./temp.04 > ./temp.05
cat ./temp.05 | xargs printf '    %-30s%s\n' > ./temp.0
cat ./temp.0 | tr , \  >> "./${BN}.BAS.COLORS.0"

### fbterm printf ESC colors
cat >> "./${BN}.BAS.COLORS.0" <<EOF

  if [ "$TERM" ="fbterm" ]; then
    t_SETCOLOR='\033[3;%d;%s}';  # for printf
    # fbterm uses decimal values in tput/ESC codes for 256 colors
    # COLOR 0 is the transparencey (background image) color
EOF
echo "t_COLOR0" > ./temp.10
for i in `seq 1 ${CN}`; do
  if [ $i -ne $CN ]; then
    echo "t_COLOR$i" >> ./temp.10
  fi
done
cat "./${BN}-dec-24-semi-colon.txt" | xargs printf "::%s::;\n" > ./temp.11
paste -d= ./temp.10 ./temp.11 > ./temp.12
cat "./${BN}-names-CAPS_.txt" | xargs printf 't_%s\n' > ./temp.13
paste -d= ./temp.13 ./temp.11 > ./temp.14
paste -d\  ./temp.12 ./temp.14 > ./temp.15
cat ./temp.15 | xargs printf '    %-30s%s\n' > ./temp.1
cat ./temp.1 >> "./${BN}.BAS.COLORS.0"

### xterm printf ESC colors
cat >> "./${BN}.BAS.COLORS.0" <<EOF

  else
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
cat ./temp.2 >> "./${BN}.BAS.COLORS.0"


### the include loader
cat >> "./${BN}.BAS.COLORS.0" <<EOF
  fi
else
  if [ ! -f "\$BASIC_COLORS" ]; then
    echo "BASIC_COLORS: file not found \'\$BASIC_COLORS\'"
  else
    . "\$BASIC_COLORS"
  fi
fi
fi
export basCOLORS_DONE=1
exit 0
EOF

cat "./${BN}.BAS.COLORS.0" | sed 's/::/\"/g' > "${BN}.BAS.COLORS"
rm -f ./temp.*
rm -f "./${BN}.BAS.COLORS.0"

echo "$CN colors written to '${BN}.BAS.COLORS'"

unset CN
unset PN
unset BN
exit 0


