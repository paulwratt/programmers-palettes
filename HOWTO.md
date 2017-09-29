# Programmers Palettes
palettes for programmers, developers, and designers.

<https://github.com/paulwratt/programmers-palettes>

* NOTE: only a complete _set_ is released, which may mean manually tweeking of the .html files, with the addition of NOTES or linking example graphics.

* NOTE: only I (paulwratt) will make commits to ./docs/programmers-palettes.html once a _set_ has been verified, as that also requires a date tagged version release.

----

* NOTE: at the moment (2017-09-30) all .html files need to be fine tuned by hand. GiMP .gpl palette files require index color names

# Update a Set

To update an individual file in a _set_ a folder called ./docs/_set_ and a GiMP .gpl is required.  All filenames are generated from the folder name, not the .gpl name:

* cd ./docs/_set_/
* ../../bin/palette-gpl2grafx2.pal.sh filename.gpl
* ../../bin/palette-gpl2paint.net.sh filename.gpl

----

# Generate a Set

To generate a _set_ a folder called ./docs/_set_ containing _set_.gpl is required.  All filenames are generated from the folder name, not the .gpl name:

* cd ./docs/_set_/
* ../../bin/pp-make-all do
* ls -1
    * HW-CGA-dec-24-comma-space.txt
    * HW-CGA-dec-24-comma.txt
    * HW-CGA-dec-24-space-comma.txt
    * HW-CGA-dec-24-space.lst
    * HW-CGA-dec-24-space.txt
    * HW-CGA.gpl
    * HW-CGA.grafx2-JASC.pal
    * HW-CGA-hex-24-html.txt
    * HW-CGA-hex-24-space.txt
    * HW-CGA-hex-24.txt
    * HW-CGA-names-Caps-space.txt
    * HW-CGA-names-CAPS_.txt
    * HW-CGA-names-CAPS.txt
    * HW-CGA-names-cCaps.txt
    * HW-CGA-names-lower_.txt
    * HW-CGA-names.lst
    * HW-CGA-names-official.txt
    * HW-CGA.paint.net.txt
    * HW-CGA.html
    * HW-CGA-decimal.html
    * HW-CGA-hex.html
    * HW-CGA-names.html
    * HW-CGA-palettes.html
    * index.html

----

# Current _set_ files (example):

* ./docs/HW-MSX/
    * HW-MSX.html
    * HW-MSX-names.html
        * HW-MSX-C-names-array-official.h
        * HW-MSX-names-Caps.txt
        * HW-MSX-names-CAPS_.txt
        * HW-MSX-names-CAPS.txt
        * HW-MSX-names-cCaps.txt
        * HW-MSX-names-lower_.txt
        * HW-MSX-names-official.txt
    * HW-MSX-decimal.html
        * HW-MSX-C-colors24-array-dec.h
        * HW-MSX-C-colors32-array-dec.h
        * HW-MSX-dec-24-RGB-comma-space.txt
        * HW-MSX-dec-24-RGB-comma.txt
        * HW-MSX-dec-24-RGB-semi-colon.txt
    * HW-MSX-hex.html
        * HW-MSX-C-cCOLOR24-printf-hex.h
        * HW-MSX-C-cCOLOR32-printf-hex.h
        * HW-MSX-hex-24-BGR-printf.txt
        * HW-MSX-hex-24-RGB-forward-slash.txt
        * HW-MSX-hex-24-RGB-html.txt
        * HW-MSX-hex-24-RGB-printf.txt
        * HW-MSX-hex-24.txt
        * HW-MSX-hex-32-BGRA-printf.txt
        * HW-MSX-hex-32-RGBA-printf.txt
    * HW-MSX-palettes.html
        * HW-MSX.gpl (GiMP)
        * HW-MSX.grafix2.pal (JASC-PAL)
        * HW-MSX.paint.net.txt (Paint.Net)
        * HW-MSX-fbterm-24-RGB-t_COLORS-printf.sh
        * HW-MSX-xterm-24-RGB-t_COLORS-printf.sh

[denilsonsa]: https://github.com/denilsonsa
[gimp-preview]: http://denilsonsa.github.io/gimp-palettes/index.html
