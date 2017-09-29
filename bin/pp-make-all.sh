#!/bin/sh
BN=`pwd`
BN=`basename "$BN"`
RD=`dirname $0`
if [ "$1" = "" -o "$1" = "--help" ]; then
  echo "programmers-palette"
  echo "Make a set conatining all data, html and palette files, from a GiMP palette file."
  echo "usage: palette-txt2vdi.pal.sh [--help]|[do]"
  echo "requires:"
  echo "       './$BN.gpl'"
  echo "       this is the only utility that does NOT"
  echo "       allow you to specify a palette file."
  echo "notes: about 30 files will be over written."
  echo "       if you only want to update a specific:"
  echo "group outputs:"
  echo "       gpl2dec-all-txt.sh"
  echo "       gpl2hex-all-txt.sh"
  echo "       gpl2names-all-txt.sh"
  echo "       txt2C-all-h.sh"
  echo "       txt2html-all.sh"
  echo "html outputs:"
  echo "       html-txt2html*.sh"
  echo "palette outputs:"
  echo "       palette-txt2*.sh"
  echo "individual outputs:"
  echo "       update-*.sh"
  echo "REMINDER:"
  echo "       make sure there are indexed color names"
  echo "       in './$BN.gpl'. eg:"
  echo "  0   0   0(tab)0 - black"
  exit 0
fi
if [ ! "$1" = "do" ]; then
  echo "Error: pp-make-all.sh [--help]|[do]"
  exit 1
fi
PF="${BN}.gpl"
if [ ! -f "./$PF" ]; then
  echo "Error: not found: './$PF'"
  echo "       this is the only utility that does NOT"
  echo "       allow you to specify a palette file."
  exit 1
fi
if [ ! "`head -n 1 "$PF"`" = "GIMP Palette" ]; then
  echo "Error: not a GiMP Palette: './$PF'"
  exit 2
fi

if "${RD}/gpl2names-all-txt.sh" "./$PF"; then
  echo "Error: in name outputs"
  echo "       make sure there are indexed color names"
  echo "       './$BN.gpl'"
  echo "  0   0   0(tab)0 - black"
  exit 1
fi
echo "completed: name outputs"
if "${RD}/gpl2dec-all-txt.sh" "./$PF"; then
  echo "Error: in decimal outputs"
  exit 2
fi
echo "completed: decimal outputs"
if "${RD}/gpl2hex-all-txt.sh" "./$PF"; then
  echo "Error: in hexadecimal outputs"
  exit 3
fi
echo "completed: hexadecimal outputs"
if "${RD}/txt2C-all-h.sh" do; then
  echo "Error: in C/C++ header outputs"
  exit 4
fi
echo "completed: decimal outputs"
if "${RD}/txt2html-all.sh" do; then
  echo "Error: in html outputs"
  exit 5
fi
echo "completed: html outputs"
echo
printf "Grafx2 palette: "
if "${RD}/palette-txt2grafx2.pal.sh" do; then
  echo "Warning: 'seq' is used"
fi
printf "Paint.Net palette: "
if "${RD}/palette-txt2paint.net.sh" do; then
  echo "Warning: names not present"
fi
printf "Photoshop palette: "
if "${RD}/palette-txt2photoshop.act.sh" do; then
  echo "Warning: 'palette-txt2photoshop.act.sh' for requirements"
fi
printf "BAS palette: "
if "${RD}/palette-txt2BAS.COLORS.sh" do; then
  echo "Warning: 'palette-txt2BAS.COLORS.sh' for requirements"
fi
printf "fbterm palette: "
if "${RD}/palette-txt2fbterm.colors.sh" do; then
  echo "Warning: 'palette-txt2fbterm.colors.sh' for requirements"
fi
printf "xterm palette: "
if "${RD}/palette-txt2xterm.colors.sh" do; then
  echo "Warning: 'palette-txt2xterm.colors.sh' for requirements"
fi
printf "VDI palette: "
if "${RD}/palette-txt2vdi.pal.sh" do; then
  echo "Warning: 'palette-txt2vdi.pal.sh' for requirements"
fi

echo "REMINDER: add any images or extra downloads to './${BN}.html'"

unset RD
unset BN
exit 0

