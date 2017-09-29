#!/bin/sh
BN=`pwd`
BN=`basename "$BN"`
RD=`dirname $0`
if [ "$1" = "" -o "$1" = "--help" ]; then
  echo "programmers-palette Extras"
  echo "Make a Atari Falcon 256 color VDI .PAL from a remapped 16 color GiMP palette (.gpl) and the common (NVDI) .PAL file."
  echo "usage: x-AtariST-remapped-VDI-common.sh [--help]|[do]"
  echo "requires:"
  echo "       '../../remapped-gimp-palette/$BN-remapped.gpl'"
  echo "       '../common.-16.pal'"
  exit 0
fi
if [ ! "$1" = "do" ]; then
  echo "Error: x-AtariST-remapped-16-2-VDI-common.sh [--help]|[do]"
  exit 1
fi

# make sure we have all the required files
if [ ! -f "../../remapped-gimp-palette/${BN}-remapped.gpl" ]; then
  echo "Error: file not found: '../../remapped-gimp-palette/${BN}-remapped.gpl'"
  exit 2
fi
if [ ! -f "../common.-16.pal" ]; then
  echo "Error: file not found: '../common.-16.pal'"
  exit 2
fi

"${RD}/palette-gpl2vdi.pal.sh" "../../remapped-gimp-palette/${BN}-remapped.gpl"
cat "../common.-16.pal" >> "./${BN}.pal"

unset RD
unset BN
exit 0
