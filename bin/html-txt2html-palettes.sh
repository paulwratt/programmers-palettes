#!/bin/sh
BN=`pwd`
BN=`basename "$BN"`
if [ "$1" = "" -o "$1" = "--help" ]; then
  echo "html-txt2html-palettes"
  echo "Pre-processed text (.txt) to color palettes  ($BN-palettes.html)"
  echo "usage: html-txt2html-palettes.sh [--help]|[do]"
  echo "notes: the following will be over written"
  echo "       './$BN-palettes.html' "
  echo "requires: "
  echo "       './$BN-hex-24-html.txt'"
  echo "       './$BN-hex-24-html-CAPS.txt'"
  echo "       './$BN-names-official.txt'"
  echo "       './$BN-dec-24-space.txt'"
  echo "       './$BN-hex-24.txt'"
  echo "       './$BN-dec-24-semi-colon'"
  echo "       './$BN-hex-24-CAPS-forward-slash.txt'"
  echo "       './$BN-dec-24-comma'"
  exit 0
fi
if [ ! "$1" = "do" ]; then
  echo "Error: html-txt2html-palettes.sh [--help]|[do]"
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
if [ ! -f "./${BN}-dec-24-space.txt" ]; then
  echo "Error: file not found: './${BN}-dec-24-space.txt'"
  exit 2
fi
if [ ! -f "./${BN}-hex-24.txt" ]; then
  echo "Error: file not found: './${BN}-hex-24.txt'"
  exit 2
fi
if [ ! -f "./${BN}-hex-24-CAPS-forward-slash.txt" ]; then
  echo "Error: file not found: './${BN}-hex-24-CAPS-forward-slash.txt'"
  exit 2
fi
if [ ! -f "./${BN}-dec-24-semi-colon.txt" ]; then
  echo "Error: file not found: './${BN}-dec-24-semi-colon.txt'"
  exit 2
fi

PN=`echo "$BN" | sed 's/HW-//g'`
CN=`grep -c -E "^[0-9]" "./${BN}-dec-24-comma-space.txt"`

### "./_set_-palettes.html"
cat > "./${BN}-palettes.html" <<EOF
<html>
<head>
<title>$PN color palettes</title>
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
$PN color palette for HTML, Grafx2, Paint.Net, fbterm, xterm, CSS, ...<br>
&nbsp;<br>
<table class="colors"><tbody><tr>
EOF

### html color table with mouse overs 
for I in `seq 1 $CN`; do
  J=$(( $I - 1 ))
  HC=`cat "./${BN}-hex-24-html-CAPS.txt" | head -n $I | tail -n 1`
  printf '<td align=center valign=middle bgcolor="' >> "./${BN}-palettes.html"
  printf "$HC" >> "./${BN}-palettes.html"
  printf '" width=32 height=32 class="color" style="background-color:' >> "./${BN}-palettes.html"
  printf "$HC" >> "./${BN}-palettes.html"
  printf '" title="' >> "./${BN}-palettes.html"
  printf "$J - " >> "./${BN}-palettes.html"
  cat "./${BN}-names-official.txt" | head -n $I | tail -n 1 >> "./${BN}-palettes.html"
  echo "$HC" >> "./${BN}-palettes.html"
  printf "`cat "./${BN}-dec-24-comma-space.txt" | head -n $I | tail -n 1`" >> "./${BN}-palettes.html"
  printf '">%s</td>' $J >> "./${BN}-palettes.html"
  if [ `expr $I % 8` -eq 0 ]; then
    if [ $I -eq $CN ]; then
      printf '</tr>' >> "./${BN}-palettes.html"
    else
      printf '</tr><tr>' >> "./${BN}-palettes.html"
    fi
  fi
done

### 
cat >> "./${BN}-palettes.html" <<EOF
</tbody></table>
&nbsp;<br>
values : <a href="${BN}.html">main</a> : <a href="${BN}-decimal.html">decimal</a> : <a href="${BN}-hex.html">hex</a> : <a href="${BN}-names.html">names</a><br>
&nbsp;<br>
NOTES: fbterm256 decimal values, xterm256 hexidecimal values<br>
<!-- optional extra notes <font color=white>NOTES:</font> color 1 (black) has been incremented (R+1,G+1,B+1)<br> -->
&nbsp;<br>
You can (also using an editor) select and copy entire columns
<table cellpadding="10" class="values">
<tr>
<th>#<br>No.</th><th>html<br>color</th><th>official<br>name</th><th>Grafx2<br>JASC-PAL</th><th>Paint<br>.Net</th><th>xterm<br>colors</th><th>fbterm<br>colors</th><th>CSS<br>rgb()</th>
</tr>
<tr>
<td nowrap>
EOF

### palette number ###
for I in `seq 1 $CN`; do
  J=$(( $I - 1 ))
  echo "$J<br>" >> "./${BN}-palettes.html"
done
echo "_" >> "./${BN}-palettes.html"
echo "</td><td nowrap>" >> "./${BN}-palettes.html"

### html color ###
for I in `seq 1 $CN`; do
  J=$(( $I - 1 ))
  echo "`cat "./${BN}-hex-24-html.txt" | head -n $I | tail -n 1`<br>" >> "./${BN}-palettes.html"
done
echo "_" >> "./${BN}-palettes.html"
echo "</td><td nowrap>" >> "./${BN}-palettes.html"

### official name ###
for I in `seq 1 $CN`; do
  J=$(( $I - 1 ))
  echo "`cat "./${BN}-names-official.txt" | head -n $I | tail -n 1`<br>" >> "./${BN}-palettes.html"
done
echo "_" >> "./${BN}-palettes.html"
echo "</td><td nowrap>" >> "./${BN}-palettes.html"

### grafx2 JASC-PAL ###
for I in `seq 1 $CN`; do
  J=$(( $I - 1 ))
  echo "`cat "./${BN}-dec-24-space.txt" | head -n $I | tail -n 1`<br>" >> "./${BN}-palettes.html"
done
echo "_" >> "./${BN}-palettes.html"
echo "</td><td nowrap>" >> "./${BN}-palettes.html"

### Paint.Net ###
for I in `seq 1 $CN`; do
  J=$(( $I - 1 ))
  echo "ff`cat "./${BN}-hex-24.txt" | head -n $I | tail -n 1`<br>" >> "./${BN}-palettes.html"
done
echo "_" >> "./${BN}-palettes.html"
echo "</td><td nowrap>" >> "./${BN}-palettes.html"

### xterm ###
for I in `seq 1 $CN`; do
  J=$(( $I - 1 ))
  echo "ff`cat "./${BN}-hex-24-CAPS-forward-slash.txt" | head -n $I | tail -n 1`<br>" >> "./${BN}-palettes.html"
done
echo "_" >> "./${BN}-palettes.html"
echo "</td><td nowrap>" >> "./${BN}-palettes.html"

### fbterm ###
for I in `seq 1 $CN`; do
  J=$(( $I - 1 ))
  echo "ff`cat "./${BN}-dec-24-semi-colon.txt" | head -n $I | tail -n 1`<br>" >> "./${BN}-palettes.html"
done
echo "_" >> "./${BN}-palettes.html"
echo "</td><td nowrap>" >> "./${BN}-palettes.html"

### CSS rgb(R,G,B); ###
for I in `seq 1 $CN`; do
  J=$(( $I - 1 ))
  echo "rgb(`cat "./${BN}-dec-24-comma.txt" | head -n $I | tail -n 1`);<br>" >> "./${BN}-palettes.html"
done

### the end ###
cat >> "./${BN}-palettes.html" <<EOF
_
</td></tr></table>
&nbsp;<br>
<table class="values">
<tr>
<th>(in ./${BN}/):</th>
</tr>
<tr><td nowrap>
<a href="./${BN}-C-names-dec-RGB-arrays.h">${BN}-C-names-dec-RGB-arrays.h</a><br>
<a href="./${BN}-C-names-hex-RGB-arrays.h">${BN}-C-names-hex-RGB-arrays.h</a><br>
<a href="./${BN}.gpl">${BN}.gpl</a><br>
<a href="./${BN}.BAS.COLORS">${BN}.BAS.COLORS</a><br>
<a href="./${BN}.grafx2-JASC.pal">${BN}.grafx2-JASC.pal</a><br>
<a href="./${BN}.paint.net.txt">${BN}.paint.net.txt</a><br>
<a href="./${BN}.photoshop.act">${BN}.photoshop.act</a><br>
<a href="./${BN}-hex-24-html.txt">${BN}-hex-24-html.txt</a><br>
<a href="./${BN}.fbterm.${CN}colors.sh">${BN}.fbterm.${CN}colors.sh</a><br>
<a href="./${BN}.xterm.${CN}colors.sh">${BN}.xterm.${CN}colors.sh</a><br>
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
