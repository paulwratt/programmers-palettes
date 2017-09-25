#!/bin/sh
BN=`pwd`
BN=`basename "$BN"`
if [ "$1" = "" -o "$1" = "--help" ]; then
  echo "html-txt2html-hex"
  echo "Pre-processed text (.txt) to Hexidecimal HTML color palette information  ($BN-hex.html)"
  echo "usage: html-txt2html-hex.sh [--help]|[do]"
  echo "notes: the following will be over written"
  echo "       './$BN-hex.html' "
  echo "requires: "
  echo "       './$BN-hex-24-html.txt'"
  echo "       './$BN-hex-24-html-CAPS.txt'"
  echo "       './$BN-names-official.txt'"
  echo "       './$BN-dec-24-comma-space.txt'"
  echo "       './$BN-hex-24.txt'"
  echo "       './$BN-hex-24-CAPS.txt'"
  echo "       './$BN-hex-24-CAPS-forward-slash.txt'"
  echo "       './$BN-hex-24-printf-CAPS-RGB888.txt'"
  echo "       './$BN-hex-32-printf-CAPS-RGBA8888.txt'"
  echo "       './$BN-hex-32-printf-CAPS-BGRA8888.txt'"
  echo "       './$BN-hex-24-printf-CAPS-BGR888.txt'"
  echo "       './$BN-dec-24-space-BRG888.txt'"
# echo "       './$BN-hex-16-printf-CAPS-BRG556.txt'"
  exit 0
fi
if [ ! "$1" = "do" ]; then
  echo "Error: html-txt2html-hex.sh [--help]|[do]"
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
if [ ! -f "./${BN}-hex-24.txt" ]; then
  echo "Error: file not found: './${BN}-hex-24.txt'"
  exit 2
fi
if [ ! -f "./${BN}-hex-24-CAPS.txt" ]; then
  echo "Error: file not found: './${BN}-hex-24-CAPS.txt'"
  exit 2
fi
if [ ! -f "./${BN}-hex-24-CAPS-forward-slash.txt" ]; then
  echo "Error: file not found: './${BN}-hex-24-CAPS-forward-slash.txt'"
  exit 2
fi
if [ ! -f "./${BN}-hex-24-printf-CAPS-RGB888.txt" ]; then
  echo "Error: file not found: './${BN}-hex-24-printf-CAPS-RGB888.txt'"
  exit 2
fi
if [ ! -f "./${BN}-hex-32-printf-CAPS-RGBA8888.txt" ]; then
  echo "Error: file not found: './${BN}-hex-32-printf-CAPS-RGBA8888.txt'"
  exit 2
fi
if [ ! -f "./${BN}-hex-32-printf-CAPS-BGRA8888.txt" ]; then
  echo "Error: file not found: './${BN}-hex-32-printf-CAPS-BGRA8888.txt'"
  exit 2
fi
if [ ! -f "./${BN}-hex-24-printf-CAPS-BGR888.txt" ]; then
  echo "Error: file not found: './${BN}-hex-24-printf-CAPS-BGR888.txt'"
  exit 2
fi
if [ ! -f "./${BN}-dec-24-space-BGR888.txt" ]; then
  echo "Error: file not found: './${BN}-dec-24-space-BGR888.txt'"
  exit 2
fi

RD=`dirname $0`
PN=`echo "$BN" | sed 's/HW-//g'`
CN=`grep -c -E "^[0-9]" "./${BN}-dec-24-comma-space.txt"`

### "./_set_-hex.html" ###
cat > "./${BN}-hex.html" <<EOF
<html>
<head>
<title>$PN color palette hex</title>
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
<h1><a href="https://paulwratt.github.io/programmers-palettes/">Programmers Palettes</a></h1>
&nbsp;<br>
$PN color palette as hexidecimal values<br>
hardware fixed index palette<br>
<!-- custom/optimized fixed index palette</br> -->
&nbsp;<br>
<table class="colors"><tbody><tr>
EOF

### html color table with mouse overs ###
for I in `seq 1 $CN`; do
  J=$(( $I - 1 ))
  HC=`cat "./${BN}-hex-24-html-CAPS.txt" | head -n $I | tail -n 1`
  printf '<td align=center valign=middle bgcolor="' >> "./${BN}-hex.html"
  printf "$HC" >> "./${BN}-hex.html"
  printf '" width=32 height=32 class="color" style="background-color:' >> "./${BN}-hex.html"
  printf "$HC" >> "./${BN}-hex.html"
  printf '" title="' >> "./${BN}-hex.html"
  printf "$J - " >> "./${BN}-hex.html"
  cat "./${BN}-names-official.txt" | head -n $I | tail -n 1 >> "./${BN}-hex.html"
  echo "$HC" >> "./${BN}-hex.html"
  printf "`cat "./${BN}-dec-24-comma-space.txt" | head -n $I | tail -n 1`" >> "./${BN}-hex.html"
  printf '">%s</td>' $J >> "./${BN}-hex.html"
  if [ `expr $I % 8` -eq 0 ]; then
    if [ $I -eq $CN ]; then
      printf '</tr>' >> "./${BN}-hex.html"
    else
      printf '</tr><tr>' >> "./${BN}-hex.html"
    fi
  fi
done

### links and notes ###
cat >> "./${BN}-hex.html" <<EOF
</tbody></table>
&nbsp;<br>
values : <a href="${BN}.html">main</a> : <a href="${BN}-decimal.html">decimal</a> : <a href="${BN}-names.html">names</a> : <a href="${BN}-palettes.html">palettes</a><br>
&nbsp;<br>
NOTES: fbterm256 decimal values, xterm256 hexidecimal values<br>
<font color=white>NOTES:</font> BGRA8888, BGR888, BRG556 are for framebuffers (graphics)<br>
<!-- optional extra notes <font color=white>NOTES:</font> color 1 (black) has been incremented (R+1,G+1,B+1)<br> -->
&nbsp;<br>
You can (also using an editor) select and copy entire columns
<table cellpadding="10" class="values">
<tr>
<th>#<br>No.</th><th>html<br>value</th><th>official<br>name</th><th>hex<br>digit</th><th>CAPS<br>hex</th><th>printf<br>RGB</th><th>printf<br>RGBA</th><th>xterm<br>value</th><th>32bit<br>BGRA8888</th><th>24bit<br>BGR888</th><th>16bit<br>BRG556</th>
</tr>
<tr>
<td nowrap>
EOF

### palette number ###
for I in `seq 1 $CN`; do
  J=$(( $I - 1 ))
  echo "$J<br>" >> "./${BN}-hex.html"
done
echo "_" >> "./${BN}-hex.html"
echo "</td><td nowrap>" >> "./${BN}-hex.html"

### html color ###
for I in `seq 1 $CN`; do
  J=$(( $I - 1 ))
  echo "`cat "./${BN}-hex-24-html.txt" | head -n $I | tail -n 1`<br>" >> "./${BN}-hex.html"
done
echo "_" >> "./${BN}-hex.html"
echo "</td><td nowrap>" >> "./${BN}-hex.html"

### official name ###
for I in `seq 1 $CN`; do
  J=$(( $I - 1 ))
  echo "`cat "./${BN}-names-official.txt" | head -n $I | tail -n 1`<br>" >> "./${BN}-hex.html"
done
echo "_" >> "./${BN}-hex.html"
echo "</td><td nowrap>" >> "./${BN}-hex.html"

### palette number hex ###
for I in `seq 1 $CN`; do
  J=$(( $I - 1 ))
  printf "%02x<br>\n" $J >> "./${BN}-hex.html"
done
echo "_" >> "./${BN}-hex.html"
echo "</td><td nowrap>" >> "./${BN}-hex.html"

### CAPS hex  ###
for I in `seq 1 $CN`; do
  J=$(( $I - 1 ))
  echo "`cat "./${BN}-hex-24-CAPS.txt" | head -n $I | tail -n 1`<br>" >> "./${BN}-hex.html"
done
echo "_" >> "./${BN}-hex.html"
echo "</td><td nowrap>" >> "./${BN}-hex.html"

### printf RGB  ###
for I in `seq 1 $CN`; do
  J=$(( $I - 1 ))
  echo "`cat "./${BN}-hex-24-printf-CAPS-RGB888.txt" | head -n $I | tail -n 1`<br>" >> "./${BN}-hex.html"
done
echo "_" >> "./${BN}-hex.html"
echo "</td><td nowrap>" >> "./${BN}-hex.html"

### printf RGBA  ###
for I in `seq 1 $CN`; do
  J=$(( $I - 1 ))
  echo "`cat "./${BN}-hex-32-printf-CAPS-RGBA8888.txt" | head -n $I | tail -n 1`<br>" >> "./${BN}-hex.html"
done
echo "_" >> "./${BN}-hex.html"
echo "</td><td nowrap>" >> "./${BN}-hex.html"

### forward slash  ###
for I in `seq 1 $CN`; do
  J=$(( $I - 1 ))
  echo "`cat "./${BN}-hex-24-CAPS-forward-slash.txt" | head -n $I | tail -n 1`<br>" >> "./${BN}-hex.html"
done
echo "_" >> "./${BN}-hex.html"
echo "</td><td nowrap>" >> "./${BN}-hex.html"

### printf BGRA  ###
for I in `seq 1 $CN`; do
  J=$(( $I - 1 ))
  echo "`cat "./${BN}-hex-32-printf-CAPS-BGRA8888.txt" | head -n $I | tail -n 1`<br>" >> "./${BN}-hex.html"
done
echo "_" >> "./${BN}-hex.html"
echo "</td><td nowrap>" >> "./${BN}-hex.html"

### printf BGR  ###
for I in `seq 1 $CN`; do
  J=$(( $I - 1 ))
  printf "`cat "./${BN}-hex-24-printf-CAPS-BGR888.txt" | head -n $I | tail -n 1`<br>" >> "./${BN}-hex.html"
  DN="`cat "./${BN}-dec-24-space-BGR888.txt" | head -n $I | tail -n 1`"
  printf " <!--  `$RD/as-dec-2-binary.sh $DN`  -->\n" >> "./${BN}-hex.html"
done
echo "_" >> "./${BN}-hex.html"
echo "</td><td nowrap>" >> "./${BN}-hex.html"

### printf 16bit BRG556  ###
echo "<!-- #F  18  1F  18  1 -->" >> "./${BN}-hex.html"
echo "<!-- #BBBBBrrrrrGGGGGG -->" >> "./${BN}-hex.html"
for I in `seq 1 $CN`; do
  echo '\x00\x00<br><!-- 0000 0  000 00  00 0000 -->' >> "./${BN}-hex.html"
done

### the end ###
cat >> "./${BN}-hex.html" <<EOF
_
</td></tr></table>
&nbsp;<br>
<table class="values">
<tr>
<th>(in ./${BN}/): ls *hex* | grep -v "\.html"</th>
</tr>
<tr><td nowrap>
<a href="./${BN}-C-hex-RGB-array.h">${BN}-C-hex-RGB-array.h</a><br>
<a href="./${BN}-C-names-hex-RGB-arrays.h">${BN}-C-names-hex-RGB-arrays.h</a><br>
<a href="./${BN}-hex-24.txt">${BN}-hex-24.txt</a><br>
<a href="./${BN}-hex-24-0x-comma-space.txt">${BN}-hex-24-0x-comma-space.txt</a><br>
<a href="./${BN}-hex-24-space.txt">${BN}-hex-24-space.txt</a><br>
<a href="./${BN}-hex-24-html.txt">${BN}-hex-24-html.txt</a><br>
<a href="./${BN}-hex-24-CAPS.txt">${BN}-hex-24-CAPS.txt</a><br>
<a href="./${BN}-hex-24-CAPS-space.txt">${BN}-hex-24-CAPS-space.txt</a><br>
<a href="./${BN}-hex-24-CAPS-forward-slash.txt">${BN}-hex-24-CAPS-forward-slash.txt</a><br>
<a href="./${BN}-hex-24-printf.txt">${BN}-hex-24-printf.txt</a><br>
<a href="./${BN}-hex-24-printf-CAPS-RGB888.txt">${BN}-hex-24-printf-CAPS-RGB888.txt</a><br>
<a href="./${BN}-hex-32-printf-CAPS-RGBA8888.txt">${BN}-hex-32-printf-CAPS-RGBA8888.txt</a><br>
<a href="./${BN}-hex-24-printf-CAPS-BGR888.txt">${BN}-hex-24-printf-CAPS-BGR888.txt</a><br>
<a href="./${BN}-hex-32-printf-CAPS-BGRA8888.txt">${BN}-hex-32-printf-CAPS-BGRA8888.txt</a><br>
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

unset DN
unset CN
unset PN
unset RD
unset BN
exit 0
