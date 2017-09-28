#!/bin/sh
while [ $# -ne 0 ]; do
  DecNum=$1
  VDI=
  if [ $DecNum -eq 0 ]; then VDI=0; fi
  if [ $DecNum -ne 0 ]; then
    VDI=$(( ( $DecNum * 4 ) - ( $DecNum / 12 ) ))
  fi
  if [ $VDI -gt 800 ]; then VDI=$(( $VDI + 1 )); fi
  printf "$VDI "
  shift
  unset VDI
done
echo
