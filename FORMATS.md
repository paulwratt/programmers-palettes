# Programmers Palettes

preview:
http://paulwratt.github.io/programmers-palettes/

palettes for programmers, developers, and designers.

https://github.com/paulwratt/programmers-palettes/tree/master/docs

an extensive suppliment to [gimp-palettes][gimp-preview] by [@denilsonsa][denilsonsa]

<https://github.com/denilsonsa/gimp-palettes>

----

# Current color formats and files (example):

* **./docs/HW-MSX/**
    * index.html - meta redirect to ..
    * HW-MSX.html - links other pages and any files not linked
    * HW-MSX-names.html - **contains:** official CAPS_ CAPS cCaps
        * **HW-MSX-names.lst** - aw dump of GiMP palette mouse over text (formated "number - name" lowercase)
        * **HW-MSX-names-official.txt** - lowercase space seperated text color names (from GiMP palette)
        * **HW-MSX-names-lower_.txt** - lower_case color names
        * **HW-MSX-names-CAPS_.txt** - CAPITAL_IZED color names (useful as defines or in shell scripts)
        * **HW-MSX-names-CAPS.txt** - CAPITALIZED, no spaces (useful in shell scripts)
        * **HW-MSX-names-Caps-space.txt** - Capialized Space Seperated color names
        * **HW-MSX-names-cCaps.txt** - cCapsColor compacted names (useful as variable names in programs)
        * **HW-MSX-C-names-array.h** - a C/C++ color names array
    * HW-MSX-decimal.html - **contains:** comma semi-colon space
        * **HW-MSX-dec-24-space.lst** - space aligned decimal RGB list (can generate .gpl from these)
        * **HW-MSX-dec-24-space-comma.txt** - space aligned comma seperated decimal RGB values (easy to read)
        * **HW-MSX-dec-24-comma.txt** - comma seperated decimal RGB values (compact, eg. CSS rgb() arguments)
        * **HW-MSX-dec-24-comma-space.txt** - comma seperated spaced decimal RGB values (eg. C argument list)
        * **HW-MSX-dec-24-space.txt** - space seperated decimal RGB values (used to generate another palette/format)
        * **HW-MSX-dec-24-semi-colon.txt** - suitable for fbterm ESC sequences using printf
        * **HW-MSX-C-dec-RGB-array.h** - C/C++ decimal RGB array
        * **HW-MSX-C-names-dec-RGB-arrays.h** - a C/C++ color names and decimal RGB arrays
    * HW-MSX-hex.html - **contains:** html hex hex; hex/ printf
        * **HW-MSX-hex-24-printf.txt** - 24bit RGB888 hexidecimal printf text
        * **HW-MSX-hex-24-space.txt** - space seperated 8bit byte RGB hex values (used to generate other RGBA formats)
        * **HW-MSX-hex-24-printf-BGR888.txt** - 24bit BGR888 hexidecimal printf text
        * **HW-MSX-hex-24-0x-comma-space.txt** - suitable for C/C++ program source
        * **HW-MSX-hex-24.txt** - 24bit RGB888 hexidecimal text
        * **HW-MSX-hex-24-html.txt** - 6 digit HTML #RRGGBB hex values
        * **HW-MSX-hex-24-CAPS-space.txt** - capitalized 8bit bytes space seperated (to make other palettes and formats)
        * **HW-MSX-hex-24-CAPS.txt** - capitalized 24bit word RGB hex values
        * **HW-MSX-hex-24-CAPS-forward-slash.txt** - suitable for xterm ESC sequences using printf
        * **HW-MSX-hex-32-printf-CAPS-BGRA8888.txt** - 32bit BGRA8888 hexidecimal printf text (RPi frambuffer <= dd)
        * **HW-MSX-hex-32-printf-CAPS-RGBA8888.txt** - 32bit RGBA8888 hexidecimal printf text
        * **HW-MSX-C-cCOLOR24-printf-hex.h** - a C/C++ cCOLORNAME24 24bit RGB hexidecimal list
        * **HW-MSX-C-cCOLOR32-printf-hex.h** - a C/C++ cCOLORNAME32 32bit RGBA hexidecimal list
        * **HW-MSX-C-hex-RGB-array.h** - C/C++ hexadecimal RGB array
        * **HW-MSX-C-names-hex-RGB-arrays.h** - a C/C++ color names and hexadecimal RGB arrays
        * **HW-MSX-C-cNames-printf-RGB-list.h** - a C/C++ cColorNames 24bit RGB hexidecimal list
    * HW-MSX-palettes.html - **contains:** gpl grafx2 paint.net
        * **HW-MSX.gpl** - GiMP palette file with mouse over color numbers and names
        * **HW-MSX.grafix2.pal** - JASC-PAL (Grafx2, Graphics Gale, PaintShop Pro)
        * **HW-MSX.paint.net.txt** - Paint.Net palette file with instructions and optional color names
        * **HW-MSX.BAS.COLORS** - ShellBASIC PSET/PRESET (Bas) palette files (fbterm + xterm + 32bit BGRA RPi framebuffer)
        * **HW-MSX.colors.bas** - ANSI (Bas) palette files (fbterm + xterm + 32bit BGRA framebuffer)
        * **HW-MSX.fbterm.16colors.sh** - shell include file for fbterm printf ESC sequences
        * **HW-MSX.xterm.16colors.sh** - shell include file for xterm printf ESC sequences
        * **HW-MSX.vdi.16colors.txt** - decimal RGB VDI palette values (0-1000)
        * **HW-MSX.vdi.hex.16colors.txt** - hexadecimal RGB VDI palette values (0000-03E8)
        * **HW-MSX.vdi.printf.16colors.sh** - hexadecimal printf values (\x00\x00-\x03\xE8)
        * **HW-MSX.vdi.16colors.pal** - (partial, of 256) VDI palette (prepend to default/common/alternate/NVDI .PAL file)

[denilsonsa]: https://github.com/denilsonsa
[gimp-preview]: http://denilsonsa.github.io/gimp-palettes/index.html
