#!/bin/sh
BN=`pwd`
BN=`basename "$BN"`
if [ "$1" = "" -o "$1" = "--help" ]; then
  echo "txt2html-all"
  echo "Pre-processed text (.txt) to HTML color palette information  (.html)"
  echo "usage: txt2html-all.sh [--help]|[do]"
  echo "notes: the following will be over written, in order"
  echo "       './$BN.html' "
  echo "       './$BN-dec.html' "
  echo "       './$BN-hex.html' "
  echo "       './$BN-names.html' "
  echo "       './$BN-palettes.html' "
  echo "requires: "
  echo "       './$BN-hex-24-html.txt'"
  echo "       './$BN-names-official.txt'"
  echo "       './$BN-dec-24-comma-space.txt'"
  echo "       './$BN-dec-24-comma'"
  echo "       './$BN-dec-24-semi-colon'"
  echo "       './$BN-dec-24-space.txt'"
  echo "       './$BN-dec-24-space-BRG888.txt'"
  echo "       './$BN-hex-24.txt'"
  echo "       './$BN-hex-24-CAPS.txt'"
  echo "       './$BN-hex-24-CAPS-forward-slash.txt'"
  echo "       './$BN-hex-24-printf-CAPS-RGB888.txt'"
  echo "       './$BN-hex-32-printf-CAPS-RGBA8888.txt'"
  echo "       './$BN-hex-32-printf-CAPS-BGRA8888.txt'"
  echo "       './$BN-hex-24-printf-CAPS-BGR888.txt'"
# echo "       './$BN-hex-16-printf-CAPS-BRG556.txt'"
  echo "       './$BN-names-CAPS_.txt'"
  echo "       './$BN-names-CAPS.txt'"
  echo "       './$BN-names-cCaps.txt'"
  echo "       './$BN-names-lower_.txt'"
  exit 0
fi
if [ ! "$1" = "do" ]; then
  echo "Error: txt2html-all.sh [--help]|[do]"
  exit 1
fi

# make sure we have all the required files
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
if [ ! -f "./${BN}-dec-24-space.txt" ]; then
  echo "Error: file not found: './${BN}-dec-24-space.txt'"
  exit 2
fi
if [ ! -f "./${BN}-dec-24-space-BGR888.txt" ]; then
  echo "Error: file not found: './${BN}-dec-24-space-BGR888.txt'"
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

### temp file html head ###
cat > "./${BN}.html.0" <<EOF
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
$PN color palette for programmers<br>
&nbsp;<br>
<table class="colors"><tbody><tr>
EOF

### html color table with mouse overs ###
printf "" > "./${BN}.html.0"
for I in `seq 1 $CN`; do
  J=$(( $I - 1 ))
  HC=`cat "./${BN}-hex-24-html-CAPS.txt" | head -n $I | tail -n 1`
  printf '<td align=center valign=middle bgcolor="' >> "./${BN}.html.0"
  printf "$HC" >> "./${BN}.html.0"
  printf '" width=32 height=32 class="color" style="background-color:' >> "./${BN}.html.0"
  printf "$HC" >> "./${BN}.html.0"
  printf '" title="' >> "./${BN}.html.0"
  printf "$J - " >> "./${BN}.html.0"
  cat "./${BN}-names-official.txt" | head -n $I | tail -n 1 >> "./${BN}.html.0"
  echo "$HC" >> "./${BN}.html.0"
  printf "`cat "./${BN}-dec-24-comma-space.txt" | head -n $I | tail -n 1`" >> "./${BN}.html.0"
  printf '">%s</td>' $J >> "./${BN}.html.0"
  if [ `expr $I % 8` -eq 0 ]; then
    if [ $I -eq $CN ]; then
      printf '</tr>' >> "./${BN}.html.0"
    else
      printf '</tr><tr>' >> "./${BN}.html.0"
    fi
  fi
done
echo "</tbody></table>" >> "./${BN}.html.0"
echo "&nbsp;<br>" >> "./${BN}.html.0"

### notes and table start ###
cat > "./${BN}.html.1" <<EOF
NOTES: fbterm256 decimal values, xterm256 hexidecimal values<br>
<!-- optional extra notes <font color=white>NOTES:</font> color 1 (black) has been incremented (R+1,G+1,B+1)<br> -->
&nbsp;<br>
You can (also using an editor) select and copy entire columns
<table cellpadding="10" class="values">
<tr>
EOF

### table dividers ###
echo "_" >> "./${BN}.html.2"
echo "</td><td nowrap>" >> "./${BN}.html.2"



### "./_set_.html" ###
cat > "./${BN}.html" <<EOF
<html>
<head>
<title>$PN color palette</title>
EOF
cat "./${BN}.html.0" >> "./${BN}.html"
cat >> "./${BN}.html" <<EOF
values : <a href="${BN}-decimal.html">decimal</a> : <a href="${BN}-hex.html">hex</a> : <a href="${BN}-names.html">names</a> : <a href="${BN}-palettes.html">palettes</a><br>
&nbsp;<br>
EOF
cat "./${BN}.html.1" >> "./${BN}.html"
cat >> "./${BN}.html" <<EOF
<th>#<br>No.</th><th>html<br>color</th><th>official<br>name</th><th>palette<br>files</th>
</tr>
<tr>
<td nowrap>
EOF

### palette number ###
for I in `seq 1 $CN`; do
  J=$(( $I - 1 ))
  echo "$J<br>" >> "./${BN}.html"
done
cat "./${BN}.html.2" >> "./${BN}.html"

### html color ###
for I in `seq 1 $CN`; do
  J=$(( $I - 1 ))
  echo "`cat "./${BN}-hex-24-html.txt" | head -n $I | tail -n 1`<br>" >> "./${BN}.html"
done
cat "./${BN}.html.2" >> "./${BN}.html"

### official name ###
for I in `seq 1 $CN`; do
  J=$(( $I - 1 ))
  echo "`cat "./${BN}-names-official.txt" | head -n $I | tail -n 1`<br>" >> "./${BN}.html"
done
cat "./${BN}.html.2" >> "./${BN}.html"

### palette downloads ###
cat >> "./${BN}.html" <<EOF
<a href="./${BN}.gpl">${BN}.gpl</a> (GiMP)<br>
<a href="./${BN}.grafx2-JASC.pal">${BN}.grafx2-JASC.pal</a> (JASC-PAL)<br>
<a href="./${BN}.paint.net.txt">${BN}.paint.net.txt</a> (Paint.Net)<br>
<a href="./${BN}.photoshop.act">${BN}.photoshop.act</a> (Adobe Photoshop)<br>
<a href="./${BN}.BAS.COLORS">${BN}.BAS.COLORS</a> (ShellBASIC)<br>
<a href="./${BN}-fbterm-colors.sh">${BN}-fbterm-colors.sh</a><br>
<a href="./${BN}-xterm-colors.sh">${BN}-xterm-colors.sh</a><br>
</td>
</tr>
</table>
<!-- optional extras
<a target="_new" href="./a-picture.png"><img src="./a-picture.png"></a>
-->
</body>
</html>
EOF



### "./_set_-decimal.html" ###
cat > "./${BN}-decimal.html" <<EOF
<html>
<head>
<title>$PN color palette decimal</title>
EOF
cat "./${BN}.html.0" >> "./${BN}-decimal.html"
cat >> "./${BN}.html" <<EOF
values : <a href="${BN}.html">main</a> : <a href="${BN}-hex.html">hex</a> : <a href="${BN}-names.html">names</a> : <a href="${BN}-palettes.html">palettes</a><br>
&nbsp;<br>
EOF
cat "./${BN}.html.1" >> "./${BN}-decimal.html"
cat >> "./${BN}-decimal.html" <<EOF
<th>#<br>No.</th><th>html<br>color</th><th>official<br>name</th><th>comma+space<br>values</th><th>comma<br>values</th><th>fbterm<br>colors</th><th>CSS<br>rgb()</th><th>C/C++<br>array</th>
</tr>
<tr>
<td nowrap>
EOF

### palette number ###
for I in `seq 1 $CN`; do
  J=$(( $I - 1 ))
  echo "$J<br>" >> "./${BN}-decimal.html"
done
cat "./${BN}.html.2" >> "./${BN}-decimal.html"

### html color ###
for I in `seq 1 $CN`; do
  J=$(( $I - 1 ))
  echo "`cat "./${BN}-hex-24-html.txt" | head -n $I | tail -n 1`<br>" >> "./${BN}-decimal.html"
done
cat "./${BN}.html.2" >> "./${BN}-decimal.html"

### official name ###
for I in `seq 1 $CN`; do
  J=$(( $I - 1 ))
  echo "`cat "./${BN}-names-official.txt" | head -n $I | tail -n 1`<br>" >> "./${BN}-decimal.html"
done
cat "./${BN}.html.2" >> "./${BN}-decimal.html"

### comma space ###
for I in `seq 1 $CN`; do
  J=$(( $I - 1 ))
  echo "`cat "./${BN}-dec-24-comma-space.txt" | head -n $I | tail -n 1`<br>" >> "./${BN}-decimal.html"
done
cat "./${BN}.html.2" >> "./${BN}-decimal.html"

### comma ###
for I in `seq 1 $CN`; do
  J=$(( $I - 1 ))
  echo "`cat "./${BN}-dec-24-comma.txt" | head -n $I | tail -n 1`<br>" >> "./${BN}-decimal.html"
done
cat "./${BN}.html.2" >> "./${BN}-decimal.html"

### semi-colon ###
for I in `seq 1 $CN`; do
  J=$(( $I - 1 ))
  echo "`cat "./${BN}-dec-24-semi-colon.txt" | head -n $I | tail -n 1`<br>" >> "./${BN}-decimal.html"
done
cat "./${BN}.html.2" >> "./${BN}-decimal.html"

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
<a href="./${BN}-fbterm-colors.sh">${BN}-fbterm-colors.sh</a><br>
</td></tr>
</table>
<p>
&nbsp;<br>
</p>
</body>
</html>
EOF



### "./_set_-hex.html" ###
cat > "./${BN}-hex.html" <<EOF
<html>
<head>
<title>$PN color palette hexidecimal</title>
EOF
cat "./${BN}.html.0" >> "./${BN}-hex.html"
cat >> "./${BN}-hex.html" <<EOF
values : <a href="${BN}.html">main</a> : <a href="${BN}-decimal.html">decimal</a> : <a href="${BN}-names.html">names</a> : <a href="${BN}-palettes.html">palettes</a><br>
&nbsp;<br>
EOF
cat "./${BN}.html.1" >> "./${BN}-hex.html"
cat >> "./${BN}-hex.html" <<EOF
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
cat "./${BN}.html.2" >> "./${BN}-hex.html"

### html color ###
for I in `seq 1 $CN`; do
  J=$(( $I - 1 ))
  echo "`cat "./${BN}-hex-24-html.txt" | head -n $I | tail -n 1`<br>" >> "./${BN}-hex.html"
done
cat "./${BN}.html.2" >> "./${BN}-hex.html"

### official name ###
for I in `seq 1 $CN`; do
  J=$(( $I - 1 ))
  echo "`cat "./${BN}-names-official.txt" | head -n $I | tail -n 1`<br>" >> "./${BN}-hex.html"
done
cat "./${BN}.html.2" >> "./${BN}-hex.html"

### palette number hex ###
for I in `seq 1 $CN`; do
  J=$(( $I - 1 ))
  printf "%02x<br>\n" $J >> "./${BN}-hex.html"
done
cat "./${BN}.html.2" >> "./${BN}-hex.html"

### CAPS hex  ###
for I in `seq 1 $CN`; do
  J=$(( $I - 1 ))
  echo "`cat "./${BN}-hex-24-CAPS.txt" | head -n $I | tail -n 1`<br>" >> "./${BN}-hex.html"
done
cat "./${BN}.html.2" >> "./${BN}-hex.html"

### printf RGB  ###
for I in `seq 1 $CN`; do
  J=$(( $I - 1 ))
  echo "`cat "./${BN}-hex-24-printf-CAPS-RGB888.txt" | head -n $I | tail -n 1`<br>" >> "./${BN}-hex.html"
done
cat "./${BN}.html.2" >> "./${BN}-hex.html"

### printf RGBA  ###
for I in `seq 1 $CN`; do
  J=$(( $I - 1 ))
  echo "`cat "./${BN}-hex-32-printf-CAPS-RGBA8888.txt" | head -n $I | tail -n 1`<br>" >> "./${BN}-hex.html"
done
cat "./${BN}.html.2" >> "./${BN}-hex.html"

### CAPS forward slash  ###
for I in `seq 1 $CN`; do
  J=$(( $I - 1 ))
  echo "`cat "./${BN}-hex-24-CAPS-forward-slash.txt" | head -n $I | tail -n 1`<br>" >> "./${BN}-hex.html"
done
cat "./${BN}.html.2" >> "./${BN}-hex.html"

### printf BGRA  ###
for I in `seq 1 $CN`; do
  J=$(( $I - 1 ))
  echo "`cat "./${BN}-hex-32-printf-CAPS-BGRA8888.txt" | head -n $I | tail -n 1`<br>" >> "./${BN}-hex.html"
done
cat "./${BN}.html.2" >> "./${BN}-hex.html"

### printf BGR  ###
for I in `seq 1 $CN`; do
  J=$(( $I - 1 ))
  printf "`cat "./${BN}-hex-24-printf-CAPS-BGR888.txt" | head -n $I | tail -n 1`<br>" >> "./${BN}-hex.html"
  DN="`cat "./${BN}-dec-24-space-BGR888.txt" | head -n $I | tail -n 1`"
  printf " <!--  `$RD/as-dec-2-binary.sh $DN`  -->\n" >> "./${BN}-hex.html"
done
cat "./${BN}.html.2" >> "./${BN}-hex.html"

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
<a href="./${BN}-xterm-colors.sh">${BN}-xterm-colors.sh</a><br>
</td></tr>
</table>
<p>
&nbsp;<br>
</p>
</body>
</html>
EOF



### "./_set_-names.html" ###
cat > "./${BN}-names.html" <<EOF
<html>
<head>
<title>$PN color palette names</title>
EOF
cat "./${BN}.html.0" >> "./${BN}-names.html"
cat >> "./${BN}-names.html" <<EOF
values : <a href="${BN}.html">main</a> : <a href="${BN}-decimal.html">decimal</a> : <a href="${BN}-hex.html">hex</a> : <a href="${BN}-palettes.html">palettes</a><br>
&nbsp;<br>
EOF
cat "./${BN}.html.1" >> "./${BN}-names.html"
cat >> "./${BN}-names.html" <<EOF
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
cat "./${BN}.html.2" >> "./${BN}-names.html"

### html color ###
for I in `seq 1 $CN`; do
  J=$(( $I - 1 ))
  echo "`cat "./${BN}-hex-24-html.txt" | head -n $I | tail -n 1`<br>" >> "./${BN}-names.html"
done
cat "./${BN}.html.2" >> "./${BN}-names.html"

### official name ###
for I in `seq 1 $CN`; do
  J=$(( $I - 1 ))
  echo "`cat "./${BN}-names-official.txt" | head -n $I | tail -n 1`<br>" >> "./${BN}-names.html"
done
cat "./${BN}.html.2" >> "./${BN}-names.html"

### CAPS underscore ###
for I in `seq 1 $CN`; do
  J=$(( $I - 1 ))
  echo "`cat "./${BN}-names-CAPS_.txt" | head -n $I | tail -n 1`<br>" >> "./${BN}-names.html"
done
cat "./${BN}.html.2" >> "./${BN}-names.html"

### CAPS ###
for I in `seq 1 $CN`; do
  J=$(( $I - 1 ))
  echo "`cat "./${BN}-names-CAPS.txt" | head -n $I | tail -n 1`<br>" >> "./${BN}-names.html"
done
cat "./${BN}.html.2" >> "./${BN}-names.html"

### lowercase underscore ###
for I in `seq 1 $CN`; do
  J=$(( $I - 1 ))
  echo "`cat "./${BN}-names-lower_.txt" | head -n $I | tail -n 1`<br>" >> "./${BN}-names.html"
done
cat "./${BN}.html.2" >> "./${BN}-names.html"

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



### "./_set_-palettes.html" ###
cat > "./${BN}-palettes.html" <<EOF
<html>
<head>
<title>$PN color palettes</title>
EOF
cat "./${BN}.html.0" >> "./${BN}-palettes.html"
cat >> "./${BN}-palettes.html" <<EOF
values : <a href="${BN}.html">main</a> : <a href="${BN}-decimal.html">decimal</a> : <a href="${BN}-hex.html">hex</a> : <a href="${BN}-names.html">names</a><br>
&nbsp;<br>
EOF
cat "./${BN}.html.1" >> "./${BN}-palettes.html"
cat >> "./${BN}-palettes.html" <<EOF
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
cat "./${BN}.html.2" >> "./${BN}-palettes.html"

### html color ###
for I in `seq 1 $CN`; do
  J=$(( $I - 1 ))
  echo "`cat "./${BN}-hex-24-html.txt" | head -n $I | tail -n 1`<br>" >> "./${BN}-palettes.html"
done
cat "./${BN}.html.2" >> "./${BN}-palettes.html"

### official name ###
for I in `seq 1 $CN`; do
  J=$(( $I - 1 ))
  echo "`cat "./${BN}-names-official.txt" | head -n $I | tail -n 1`<br>" >> "./${BN}-palettes.html"
done
cat "./${BN}.html.2" >> "./${BN}-palettes.html"

### grafx2 JASC-PAL ###
for I in `seq 1 $CN`; do
  J=$(( $I - 1 ))
  echo "`cat "./${BN}-dec-24-space.txt" | head -n $I | tail -n 1`<br>" >> "./${BN}-palettes.html"
done
cat "./${BN}.html.2" >> "./${BN}-palettes.html"

### Paint.Net ###
for I in `seq 1 $CN`; do
  J=$(( $I - 1 ))
  echo "ff`cat "./${BN}-hex-24.txt" | head -n $I | tail -n 1`<br>" >> "./${BN}-palettes.html"
done
cat "./${BN}.html.2" >> "./${BN}-palettes.html"

### xterm ###
for I in `seq 1 $CN`; do
  J=$(( $I - 1 ))
  echo "ff`cat "./${BN}-hex-24-forward-slash.txt" | head -n $I | tail -n 1`<br>" >> "./${BN}-palettes.html"
done
cat "./${BN}.html.2" >> "./${BN}-palettes.html"

### fbterm ###
for I in `seq 1 $CN`; do
  J=$(( $I - 1 ))
  echo "ff`cat "./${BN}-dec-24-semi-colon.txt" | head -n $I | tail -n 1`<br>" >> "./${BN}-palettes.html"
done
cat "./${BN}.html.2" >> "./${BN}-palettes.html"

### CSS rgb(R,G,B); ###
for I in `seq 1 $CN`; do
  J=$(( $I - 1 ))
  echo "rgb(`cat "./${BN}-dec-24-comma.txt" | head -n $I | tail -n 1`);<br>" >> "./${BN}-decimal.html"
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
</td></tr>
</table>
<p>
&nbsp;<br>
</p>
</body>
</html>
EOF

rm -f "./${BN}.html.?"

echo "$CN colors processed"

unset DN
unset CN
unset PN
unset RD
unset BN
exit 0
