#!/bin/sh
BN=`pwd`
BN=`basename "$BN"`
if [ "$1" = "" -o "$1" = "--help" ]; then
  echo "palette-gpl2vdi.pal"
  echo "GiMP palette (.gpl) to Atari ST, Falcon, ARAnyM VDI color palette  (.pal)"
  echo "usage: palette-gpl2vdi.pal.sh [--help]|[palette.gpl]"
  echo "notes: the following will be over written."
  echo "       './$BN-dec-24-space.txt' "
  echo "       './$BN.vdi.colors.txt' "
  echo "       './$BN.vdi.hex.pal' "
  echo "       './$BN.vdi.color.pal' "
  echo "naming convention: "
  echo "       '\$BN uses the basename of the current directory'"
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

grep -E "^[\ 0-9]" "$1" | cut --output-delimiter=, --characters=1-3,5-7,9-11 | tr -d \  | tr , \  > "${BN}-dec-24-space.txt"

RD=`dirname $0`
CN=`grep -c -E "^[0-9]" "./${BN}-dec-24-space.txt"`

printf "" > "./${BN}.vdi.${CN}colors.txt"
printf "" > "./${BN}.vdi.hex.${CN}colors.txt"
printf "" > "./${BN}.vdi.${CN}colors.pal"
printf '#!/bin/sh\nPF=`which printf`\n$PF "' > "./${BN}.vdi.printf.${CN}colors.sh"
for I in `seq 1 $CN`; do
  "$RD/as-channel-2-VDI.sh" `cat "./${BN}-dec-24-space.txt" | head -n $I | tail -n 1` >> "./${BN}.vdi.${CN}colors.txt"
  "$RD/as-VDI-dec-2-hex.sh" `cat "./${BN}.vdi.${CN}colors.txt" | head -n $I | tail -n 1` >> "./${BN}.vdi.hex.${CN}colors.txt"
  for J in `cat ./${BN}.vdi.hex.${CN}colors.txt | head -n $I | tail -n 1`; do
    M="\x`echo "$J" | cut -c 1-2`"
    N="\x`echo "$J" | cut -c 3-4`"
    printf "$M$N" >> "./${BN}.vdi.printf.${CN}colors.sh"
  done
done
printf "\" > \"./${BN}.vdi.${CN}colors.pal\"\n" >> "./${BN}.vdi.printf.${CN}colors.sh"
chmod 0777 "./${BN}.vdi.printf.${CN}colors.sh"
"./${BN}.vdi.printf.${CN}colors.sh"

echo "$CN colors written to '${BN}.vdi.${CN}colors.pal'"

unset CN
unset RD
unset BN
exit 0