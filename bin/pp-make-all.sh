#!/bin/sh
BN=`pwd`
BN=`basename "$BN"`
RD=`dirname $0`
if [ "$1" = "" -o "$1" = "--help" ]; then
  echo "programmers-palette"
  echo "Make a set containing all data, html and palette files, from a GiMP palette file."
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

"${RD}/gpl2names-all-txt.sh" "./$PF"
echo "completed: name outputs"
"${RD}/gpl2dec-all-txt.sh" "./$PF"
echo "completed: decimal outputs"
"${RD}/gpl2hex-all-txt.sh" "./$PF"
echo "completed: hexadecimal outputs"
"${RD}/txt2C-all-h.sh" do
echo "completed: C/C++ outputs"
"${RD}/txt2html-all.sh" do
echo "completed: html outputs"
printf "Grafx2 palette: "
"${RD}/palette-txt2grafx2.pal.sh" do
printf "Paint.Net palette: "
"${RD}/palette-txt2paint.net.sh" do
printf "Photoshop palette: "
"${RD}/palette-txt2photoshop.act.sh" do
printf "BAS palette: "
"${RD}/palette-txt2BAS.COLORS.sh" do
printf "fbterm palette: "
"${RD}/palette-txt2fbterm.colors.sh" do
printf "xterm palette: "
"${RD}/palette-txt2xterm.colors.sh" do
printf "VDI palette: "
"${RD}/palette-txt2vdi.pal.sh" do
echo
echo "REMINDER: add any images or extra downloads to './${BN}.html'"
echo "          add platform specific palette files under '../x/'"

unset RD
unset BN
exit 0
