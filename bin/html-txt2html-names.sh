#!/bin/sh
BN=`pwd`
BN=`basename "$BN"`
if [ "$1" = "" -o "$1" = "--help" ]; then
  echo "html-txt2html-names"
  echo "Pre-processed text (.txt) to color palette name information  ($BN-names.html)"
  echo "usage: html-txt2html-names.sh [--help]|[do]"
  echo "notes: the following will be over written"
  echo "       './$BN-names.html' "
  echo "requires: "
  echo "       './$BN-hex-24-html.txt'"
  echo "       './$BN-hex-24-html-CAPS.txt'"
  echo "       './$BN-names-official.txt'"
  echo "       './$BN-names-CAPS_.txt'"
  echo "       './$BN-names-CAPS.txt'"
  echo "       './$BN-names-cCaps.txt'"
  echo "       './$BN-names-lower_.txt'"
  exit 0
fi
if [ ! "$1" = "do" ]; then
  echo "Error: html-txt2html-names.sh [--help]|[do]"
  exit 1
fi

# make sure we have all the required files
if [ ! -f "./${BN}-hex-24-html-CAPS.txt" ]; then
  echo "Error: file not found: './${BN}-hex-24-html-CAPS.txt'"
  exit 2
fi
if [ ! -f "./${BN}-hex-24-html.txt" ]; then
  echo "Error: file not found: './${BN}-hex-24-html.txt'"
  exit 2
fi
if [ ! -f "./${BN}-names-official.txt" ]; then
  echo "Error: file not found: './${BN}-names-official.txt'"
  exit 2
fi
if [ ! -f "./${BN}-names-CAPS_.txt" ]; then
  echo "Error: file not found: './${BN}-names-CAPS_.txt'"
  exit 2
fi
if [ ! -f "./${BN}-names-CAPS.txt" ]; then
  echo "Error: file not found: './${BN}-names-CAPS.txt'"
  exit 2
fi
if [ ! -f "./${BN}-names-cCaps.txt" ]; then
  echo "Error: file not found: './${BN}-names-cCaps.txt'"
  exit 2
fi
if [ ! -f "./${BN}-names-lower_.txt" ]; then
  echo "Error: file not found: './${BN}-names-lower_.txt'"
  exit 2
fi

PN=`echo "$BN" | sed 's/HW-//g'`
CN=`grep -c -E "^[0-9]" "./${BN}-dec-24-comma-space.txt"`

### "./_set_.html"
cat > "./${BN}-names.html" <<EOF
<html>
<head>
<title>$PN color palette decimal</title>
<style>
body {
    font-family: sans-serif;
}
table.colors {
    border-collapse: collapse;
    table-layout: fixed;
    font-size: 8px;
}
.color {
    width: 32px;
    height: 32px;
}
table.values tr td {
    font-family: monospace;
}
</style>
</head>
<body>
&nbsp;<br>
$PN color palette as decimal values<br>
&nbsp;<br>
<table class="colors"><tbody><tr>
EOF

### html color table with mouse overs 
for I in `seq 1 $CN`; do
  J=$(( $I - 1 ))
  HC=`cat "./${BN}-hex-24-html-CAPS.txt" | head -n $I | tail -n 1`
  printf '<td align=center valign=middle bgcolor="' >> "./${BN}-names.html"
  printf "$HC" >> "./${BN}-names.html"
  printf '" width=32 height=32 class="color" style="background-color:' >> "./${BN}-names.html"
  printf "$HC" >> "./${BN}-names.html"
  printf '" title="' >> "./${BN}-names.html"
  printf "$J - " >> "./${BN}-names.html"
  cat "./${BN}-names-official.txt" | head -n $I | tail -n 1 >> "./${BN}-names.html"
  echo "$HC" >> "./${BN}-names.html"
  printf "`cat "./${BN}-dec-24-comma-space.txt" | head -n $I | tail -n 1`" >> "./${BN}-names.html"
  printf '">%s</td>' $J >> "./${BN}-names.html"
  if [ `expr $I % 8` -eq 0 ]; then
    if [ $I -eq $CN ]; then
      printf '</tr>' >> "./${BN}-names.html"
    else
      printf '</tr><tr>' >> "./${BN}-names.html"
    fi
  fi
done

### 
cat >> "./${BN}-names.html" <<EOF
</tbody></table>
&nbsp;<br>
values : <a href="${BN}.html">main</a> : <a href="${BN}-decimal.html">decimal</a> : <a href="${BN}-hex.html">hex</a> : <a href="${BN}-palettes.html">palettes</a><br>
<!-- &nbsp;<br>
NOTES: fbterm256 decimal values, xterm256 hexidecimal values<br> -->
<!-- optional extra notes <font color=white>NOTES:</font> color 1 (black) has been incremented (R+1,G+1,B+1)<br> -->
&nbsp;<br>
You can (also using an editor) select and copy entire columns
<table cellpadding="10" class="values">
<tr>
<th>#<br>No.</th><th>html<br>color</th><th>official<br>name</th><th>CAPS_<br>name</th><th>CAPS<br>name</th><th>lower_<br>name</th><th>cCaps<br>name</th>
</tr>
<tr>
<td nowrap>
EOF

### palette number ###
for I in `seq 1 $CN`; do
  J=$(( $I - 1 ))
  echo "$J<br>" >> "./${BN}-names.html"
done
echo "_" >> "./${BN}-names.html"
echo "</td><td nowrap>" >> "./${BN}-names.html"

### html color ###
for I in `seq 1 $CN`; do
  J=$(( $I - 1 ))
  echo "`cat "./${BN}-hex-24-html.txt" | head -n $I | tail -n 1`<br>" >> "./${BN}-names.html"
done
echo "_" >> "./${BN}-names.html"
echo "</td><td nowrap>" >> "./${BN}-names.html"

### official name ###
for I in `seq 1 $CN`; do
  J=$(( $I - 1 ))
  echo "`cat "./${BN}-names-official.txt" | head -n $I | tail -n 1`<br>" >> "./${BN}-names.html"
done
echo "_" >> "./${BN}-names.html"
echo "</td><td nowrap>" >> "./${BN}-names.html"

### CAPS underscore ###
for I in `seq 1 $CN`; do
  J=$(( $I - 1 ))
  echo "`cat "./${BN}-names-CAPS_.txt" | head -n $I | tail -n 1`<br>" >> "./${BN}-names.html"
done
echo "_" >> "./${BN}-names.html"
echo "</td><td nowrap>" >> "./${BN}-names.html"

### CAPS ###
for I in `seq 1 $CN`; do
  J=$(( $I - 1 ))
  echo "`cat "./${BN}-names-CAPS.txt" | head -n $I | tail -n 1`<br>" >> "./${BN}-names.html"
done
echo "_" >> "./${BN}-names.html"
echo "</td><td nowrap>" >> "./${BN}-names.html"

### lowercase underscore ###
for I in `seq 1 $CN`; do
  J=$(( $I - 1 ))
  echo "`cat "./${BN}-names-lower_.txt" | head -n $I | tail -n 1`<br>" >> "./${BN}-names.html"
done
echo "_" >> "./${BN}-names.html"
echo "</td><td nowrap>" >> "./${BN}-names.html"

### cCaps ###
for I in `seq 1 $CN`; do
  J=$(( $I - 1 ))
  echo "`cat "./${BN}-names-cCaps.txt" | head -n $I | tail -n 1`<br>" >> "./${BN}-names.html"
done

### the end ###
cat >> "./${BN}-names.html" <<EOF
_
</td></tr></table>
&nbsp;<br>
<table class="values">
<tr>
<th>(in ./${BN}/): ls *dec* | grep -v "\.html"</th>
</tr>
<tr><td nowrap>
<a href="./${BN}-C-names-array.h">${BN}-C-names-array.h</a><br>
<a href="./${BN}-C-names-dec-RGB-arrays.h">${BN}-C-names-dec-RGB-arrays.h</a><br>
<a href="./${BN}-C-names-hex-RGB-arrays.h">${BN}-C-names-hex-RGB-arrays.h</a><br>
<a href="./${BN}-names.lst">${BN}-names.lst</a><br>
<a href="./${BN}-names-CAPS_.txt">${BN}-names-CAPS_.txt</a><br>
<a href="./${BN}-names-CAPS.txt">${BN}-names-CAPS.txt</a><br>
<a href="./${BN}-names-cCaps.txt">${BN}-names-cCaps.txt</a><br>
<a href="./${BN}-names-lower_.txt">${BN}-names-lower_.txt</a><br>
<a href="./${BN}-names-official.txt">${BN}-names-official.txt</a><br>
</td></tr>
</table>
<p>
&nbsp;<br>
</p>
</body>
</html>
EOF

echo "$CN colors processed"

unset CN
unset PN
unset BN
exit 0
