#!/bin/sh
while [ $# -ne 0 ]; do
  DecNum=$1
  Binary=
  if [ $DecNum -eq 0 ]; then Binary=0; fi
  while [ $DecNum -ne 0 ]; do
    Bit=$(( $DecNum % 2 ))
    Binary=$Bit$Binary
    DecNum=$(( $DecNum / 2 ))
  done
  L=`echo "$Binary" | wc -c`
  if [ $L -lt 8 ]; then
    for J in `seq $L 8`; do
      Binary="0$Binary"
    done
  fi
  printf "$Binary "
  shift
  unset Binary
done
echo
