#!/bin/sh
BN=`pwd`
BN=`basename "$BN"`
if [ "$1" = "" -o "$1" = "--help" ]; then
  echo "palette-gpl2vdi.pal"
  echo "Pre-processed text (.txt) to Atari ST, Falcon, ARAnyM VDI color palette  (.pal)"
  echo "usage: palette-gpl2vdi.pal.sh [--help]|[do]"
  echo "notes: './$BN.vdi.pal' "
  echo "       will be over written."
  echo "requires: "
  echo "       './$BN-dec-24-space.txt'"
  exit 0
fi
if [ ! "$1" = "do" ]; then
  echo "Error: palette-gpl2vdi.pal.sh [--help]|[do]"
  exit 1
fi

# make sure we have all the required files
if [ ! -f "./${BN}-dec-24-space.txt" ]; then
  echo "Error: file not found: './${BN}-dec-24-space.txt'"
  exit 2
fi

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
