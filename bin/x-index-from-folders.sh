#!/bin/sh
BN=`pwd`
BN=`basename "$BN"`
if [ "$BN" = "x" -a -f "../../docs/x/index.html" ]; then
  echo "you must edit './index.html' by hand"
  exit 0
fi

CD=`date`
cat > index.html <<EOF
<html>
<title>files list</title>
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
<h2>Programmers Palettes<h2>
<h3>extras: $1${BN}/</h3>
<hr>
<table class="values">
<tr><td>
<a href="../index.html">.. (parent)</a><br>
EOF

for I in `ls --group-directories-first -1 | grep -v "\.html"`;do
  if [ -d "./$I" ]; then
    echo "<a href=\"./$I/index.html\">$I/</a><br>" >> index.html
  else
    echo "<a href=\"./$I/index.html\">$I</a><br>" >> index.html
  fi
done

cat >> index.html <<EOF
</td></tr></table>
<hr>
<center><font size=-3>generated: ${CD}</font></center>
</body>
</html>
EOF

unset CD
unset BN
exit 0
