#!/bin/sh
for i in $@; do
# B=`echo "${i:0:1}" | tr a-z A-Z`${i:1}
 B=`echo $i | sed  's/^\(.\)/\U\1/g'`
 echo -n "$B "
done
unset B
echo
exit 0
