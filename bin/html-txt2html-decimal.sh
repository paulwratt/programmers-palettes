#!/bin/sh
BN=`pwd`
BN=`basename "$BN"`
if [ "$1" = "" -o "$1" = "--help" ]; then
  echo "html-txt2html-decimal"
  echo "Pre-processed text (.txt) to Decimal HTML color palette information  ($BN-decimal.html)"
  echo "usage: html-txt2html-decimal.sh [--help]|[do]"
  echo "notes: the following will be over written"
  echo "       './$BN-decimal.html' "
  echo "requires: "
  echo "       './$BN-hex-24-html.txt'"
  echo "       './$BN-hex-24-html-CAPS.txt'"
  echo "       './$BN-names-official.txt'"
  echo "       './$BN-dec-24-comma-space.txt'"
  echo "       './$BN-dec-24-comma.txt'"
  echo "       './$BN-dec-24-semi-colon.txt'"
  exit 0
fi
if [ ! "$1" = "do" ]; then
  echo "Error: html-txt2html-decimal.sh [--help]|[do]"
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
if [ ! -f "./${BN}-dec-24-comma-space.txt" ]; then
  echo "Error: file not found: './${BN}-dec-24-comma-space.txt'"
  exit 2
fi
if [ ! -f "./${BN}-dec-24-comma.txt" ]; then
  echo "Error: file not found: './${BN}-dec-24-comma.txt'"
  exit 2
fi
if [ ! -f "./${BN}-dec-24-semi-colon.txt" ]; then
  echo "Error: file not found: './${BN}-dec-24-semi-colon.txt'"
  exit 2
fi

PN=`echo "$BN" | sed 's/HW-//g'`
CN=`grep -c -E "^[0-9]" "./${BN}-dec-24-comma-space.txt"`

### "./_set_.html"
cat > "./${BN}-decimal.html" <<EOF
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
  printf '<td align=center valign=middle bgcolor="' >> "./${BN}-decimal.html"
  printf "$HC" >> "./${BN}-decimal.html"
  printf '" width=32 height=32 class="color" style="background-color:' >> "./${BN}-decimal.html"
  printf "$HC" >> "./${BN}-decimal.html"
  printf '" title="' >> "./${BN}-decimal.html"
  printf "$J - " >> "./${BN}-decimal.html"
  cat "./${BN}-names-official.txt" | head -n $I | tail -n 1 >> "./${BN}-decimal.html"
  echo "$HC" >> "./${BN}-decimal.html"
  printf "`cat "./${BN}-dec-24-comma-space.txt" | head -n $I | tail -n 1`" >> "./${BN}-decimal.html"
  printf '">%s</td>' $J >> "./${BN}-decimal.html"
  if [ `expr $I % 8` -eq 0 ]; then
    if [ $I -eq $CN ]; then
      printf '</tr>' >> "./${BN}-decimal.html"
    else
      printf '</tr><tr>' >> "./${BN}-decimal.html"
    fi
  fi
done

### 
cat >> "./${BN}-decimal.html" <<EOF
</tbody></table>
&nbsp;<br>
values : <a href="${BN}.html">main</a> : <a href="${BN}-hex.html">hex</a> : <a href="${BN}-names.html">names</a> : <a href="${BN}-palettes.html">palettes</a><br>
&nbsp;<br>
NOTES: fbterm256 decimal values, xterm256 hexidecimal values<br>
<!-- optional extra notes <font color=white>NOTES:</font> color 1 (black) has been incremented (R+1,G+1,B+1)<br> -->
&nbsp;<br>
You can (also using an editor) select and copy entire columns
<table cellpadding="10" class="values">
<tr>
<th>#<br>No.</th><th>html<br>color</th><th>official<br>name</th><th>comma+space<br>values</th><th>comma<br>values</th><th>fbterm<br>colors</th><th>CSS<br>rgb()</th><th>C/C++<br>array</th>
</tr>
<tr>
<td nowrap>
EOF

### palette number
for I in `seq 1 $CN`; do
  J=$(( $I - 1 ))
  echo "$J<br>" >> "./${BN}-decimal.html"
done
echo "_" >> "./${BN}-decimal.html"
echo "</td><td nowrap>" >> "./${BN}-decimal.html"

### html color
for I in `seq 1 $CN`; do
  J=$(( $I - 1 ))
  echo "`cat "./${BN}-hex-24-html.txt" | head -n $I | tail -n 1`<br>" >> "./${BN}-decimal.html"
done
echo "_" >> "./${BN}-decimal.html"
echo "</td><td nowrap>" >> "./${BN}-decimal.html"

### official name ###
for I in `seq 1 $CN`; do
  J=$(( $I - 1 ))
  echo "`cat "./${BN}-names-official.txt" | head -n $I | tail -n 1`<br>" >> "./${BN}-decimal.html"
done
echo "_" >> "./${BN}-decimal.html"
echo "</td><td nowrap>" >> "./${BN}-decimal.html"

### comma space ###
for I in `seq 1 $CN`; do
  J=$(( $I - 1 ))
  echo "`cat "./${BN}-dec-24-comma-space.txt" | head -n $I | tail -n 1`<br>" >> "./${BN}-decimal.html"
done
echo "_" >> "./${BN}-decimal.html"
echo "</td><td nowrap>" >> "./${BN}-decimal.html"

### comma ###
for I in `seq 1 $CN`; do
  J=$(( $I - 1 ))
  echo "`cat "./${BN}-dec-24-comma.txt" | head -n $I | tail -n 1`<br>" >> "./${BN}-decimal.html"
done
echo "_" >> "./${BN}-decimal.html"
echo "</td><td nowrap>" >> "./${BN}-decimal.html"

### semi-colon ###
for I in `seq 1 $CN`; do
  J=$(( $I - 1 ))
  echo "`cat "./${BN}-dec-24-semi-colon.txt" | head -n $I | tail -n 1`<br>" >> "./${BN}-decimal.html"
done
echo "_" >> "./${BN}-decimal.html"
echo "</td><td nowrap>" >> "./${BN}-decimal.html"

### CSS rgb(R,G,B); ###
for I in `seq 1 $CN`; do
  J=$(( $I - 1 ))
  echo "rgb(`cat "./${BN}-dec-24-comma.txt" | head -n $I | tail -n 1`);<br>" >> "./${BN}-decimal.html"
done
echo "_" >> "./${BN}-decimal.html"
echo "</td><td nowrap>" >> "./${BN}-decimal.html"

### C array ###
printf "char colors[][3] = { " >> "./${BN}-decimal.html"
for I in `seq 1 $CN`; do
  J=$(( $I - 1 ))
  printf "{ `cat "./${BN}-dec-24-comma-space.txt" | head -n $I | tail -n 1` }" >> "./${BN}-decimal.html"
  if [ $I -ne $CN ]; then
    printf ",<br>\n" >> "./${BN}-decimal.html"
  else
    printf " };<br>\n" >> "./${BN}-decimal.html"
  fi
done

### the end ###
cat >> "./${BN}-decimal.html" <<EOF
_
</td></tr></table>
&nbsp;<br>
<table class="values">
<tr>
<th>(in ./${BN}/): ls *dec* | grep -v "\.html"</th>
</tr>
<tr><td nowrap>
<a href="./${BN}-C-dec-RGB-array.h">${BN}-C-dec-RGB-array.h</a><br>
<a href="./${BN}-C-names-dec-RGB-arrays.h">${BN}-C-names-dec-RGB-arrays.h</a><br>
<a href="./${BN}-dec-24-space.lst">${BN}-dec-24-space.lst</a><br>
<a href="./${BN}-dec-24-space.txt">${BN}-dec-24-space.txt</a><br>
<a href="./${BN}-dec-24-space-comma.txt">${BN}-dec-24-space-comma.txt</a><br>
<a href="./${BN}-dec-24-comma-space.txt">${BN}-dec-24-comma-space.txt</a><br>
<a href="./${BN}-dec-24-comma.txt">${BN}-dec-24-comma.txt</a><br>
<a href="./${BN}-dec-24-semi-colon.txt">${BN}-dec-24-semi-colon.txt</a><br>
<a href="./${BN}-dec-24-space-BGR888.txt">${BN}-dec-24-space-BGR888.txt</a><br>
<a href="./${BN}-dec-32-space-BGRA8888.txt">${BN}-dec-32-space-BGRA8888.txt</a><br>
<a href="./${BN}-dec-24-space-BRG888.txt">${BN}-dec-24-space-BRG888.txt</a><br>
<a href="./${BN}-fbterm-${CN}colors.sh">${BN}-fbterm-${CN}colors.sh</a><br>
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
