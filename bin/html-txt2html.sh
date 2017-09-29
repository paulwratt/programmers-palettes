#!/bin/sh
BN=`pwd`
BN=`basename "$BN"`
if [ "$1" = "" -o "$1" = "--help" ]; then
  echo "html-txt2html"
  echo "Pre-processed text (.txt) to root HTML color palette information  ($BN.html)"
  echo "usage: html-txt2html.sh [--help]|[do]"
  echo "notes: the following will be over written"
  echo "       './$BN.html' "
  echo "requires: "
  echo "       './$BN-hex-24-html.txt'"
  echo "       './$BN-hex-24-html-CAPS.txt'"
  echo "       './$BN-names-official.txt'"
  echo "       './$BN-dec-24-comma-space.txt'"
  exit 0
fi
if [ ! "$1" = "do" ]; then
  echo "Error: html-txt2html.sh [--help]|[do]"
  exit 1
fi

# make sure we have all the required files
if [ ! -f "./${BN}-hex-24-html.txt" ]; then
  echo "Error: file not found: './${BN}-hex-24-html.txt'"
  exit 2
fi
if [ ! -f "./${BN}-hex-24-html-CAPS.txt" ]; then
  echo "Error: file not found: './${BN}-hex-24-html-CAPS.txt'"
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

RD=`dirname $0`
PN=`echo "$BN" | sed 's/HW-//g'`
CN=`grep -c -E "^[0-9]" "./${BN}-dec-24-comma-space.txt"`

### "./index.html" ###
cat > "./index.html" <<EOF
<html>
<head>
<title>Programmers Palettes: ${BN}</title>
<meta http-equiv="refresh" content="0;URL='./${BN}.html'" />
</head>
<body>
redirect to <a href="./${BN}.html">${BN}</a>
</body>
</html>
EOF

### "./_set_.html" ###
cat > "./${BN}.html" <<EOF
<html>
<head>
<title>$PN color palette</title>
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
<h2><a href="https://paulwratt.github.io/programmers-palettes/">Programmers Palettes</a></h2>
$PN color palette for programmers<br>
hardware fixed index palette<br>
<!-- custom/optimized fixed index palette</br> -->
&nbsp;<br>
<table class="colors"><tbody><tr>
EOF

### html color table with mouse overs 
for I in `seq 1 $CN`; do
  J=$(( $I - 1 ))
  HC=`cat "./${BN}-hex-24-html-CAPS.txt" | head -n $I | tail -n 1`
  printf '<td align=center valign=middle bgcolor="' >> "./${BN}.html"
  printf "$HC" >> "./${BN}.html"
  printf '" width=32 height=32 class="color" style="background-color:' >> "./${BN}.html"
  printf "$HC" >> "./${BN}.html"
  printf '" title="' >> "./${BN}.html"
  printf "$J - " >> "./${BN}.html"
  cat "./${BN}-names-official.txt" | head -n $I | tail -n 1 >> "./${BN}.html"
  echo "$HC" >> "./${BN}.html"
  printf "`cat "./${BN}-dec-24-comma-space.txt" | head -n $I | tail -n 1`" >> "./${BN}.html"
  printf '">%s</td>' $J >> "./${BN}.html"
  if [ `expr $I % 8` -eq 0 ]; then
    if [ $I -eq $CN ]; then
      printf '</tr>' >> "./${BN}.html"
    else
      printf '</tr><tr>' >> "./${BN}.html"
    fi
  fi
done

### 
cat >> "./${BN}.html" <<EOF
</tbody></table>
&nbsp;<br>
values : <a href="${BN}-decimal.html">decimal</a> : <a href="${BN}-hex.html">hex</a> : <a href="${BN}-names.html">names</a> : <a href="${BN}-palettes.html">palettes</a><br>
&nbsp;<br>
NOTES: fbterm256 decimal values, xterm256 hexidecimal values<br>
<!-- optional extra notes <font color=white>NOTES:</font> color 1 (black) has been incremented (R+1,G+1,B+1)<br> -->
&nbsp;<br>
You can (also using an editor) select and copy entire columns
<table cellpadding="10" class="values">
<tr>
<th>#<br>No.</th><th>html<br>color</th><th>official<br>name</th><th>palette<br>files</th>
</tr>
<tr>
<td nowrap>
EOF

### palette number
for I in `seq 1 $CN`; do
  J=$(( $I - 1 ))
  echo "$J<br>" >> "./${BN}.html"
done
echo "_" >> "./${BN}.html"
echo "</td><td nowrap>" >> "./${BN}.html"

### html color
for I in `seq 1 $CN`; do
  J=$(( $I - 1 ))
  echo "`cat "./${BN}-hex-24-html.txt" | head -n $I | tail -n 1`<br>" >> "./${BN}.html"
done
echo "_" >> "./${BN}.html"
echo "</td><td nowrap>" >> "./${BN}.html"

### official name ###
for I in `seq 1 $CN`; do
  J=$(( $I - 1 ))
  echo "`cat "./${BN}-names-official.txt" | head -n $I | tail -n 1`<br>" >> "./${BN}.html"
done
echo "_" >> "./${BN}.html"
echo "</td><td nowrap>" >> "./${BN}.html"

### palette downloads ###
cat >> "./${BN}.html" <<EOF
<a href="./${BN}.gpl">${BN}.gpl</a> (GiMP)<br>
<a href="./${BN}.grafx2.JASC.pal">${BN}.grafx2.JASC.pal</a> (JASC-PAL)<br>
<a href="./${BN}.paint.net.txt">${BN}.paint.net.txt</a> (Paint.Net)<br>
<a href="./${BN}.photoshop.act">${BN}.photoshop.act</a> (Adobe Photoshop)<br>
<a href="./${BN}.BAS.COLORS">${BN}.BAS.COLORS</a> (ShellBASIC)<br>
<a href="./${BN}.fbterm.${CN}colors.sh">${BN}.fbterm.${CN}colors.sh</a><br>
<a href="./${BN}.xterm.${CN}colors.sh">${BN}.xterm.${CN}colors.sh</a><br>
EOF

### the end ###
cat >> "./${BN}.html" <<EOF
</td>
</tr>
</table>
&nbsp<br>
<h3>Extras</h3>
There are more palette files available <a href="https://github.com/paulwratt/programmers-palettes/tree/master/docs/${BN}">here</a> (eg Atari Falcon VDI palette).<br>
There are platform specific palettes available <a href="../x/index.html">here</a> (eg remapped palette as Atari ST .PI1 image)<br>
&nbsp<br>
<!-- optional extras
<a target="_new" href="./a-picture.png"><img src="./a-picture.png"></a> <a target="_new" href="./a-picture.gif"><img src="./a-picture.gif"></a><br>
<a href="./a-download.ext">download.ext</a><br>
-->
</body>
</html>
EOF

echo "$CN colors processed"

unset CN
unset PN
unset RD
unset BN
exit 0
