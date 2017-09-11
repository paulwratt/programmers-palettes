# Programmers Palettes
palettes for programmers, developers, and designers.

<https://github.com/paulwratt/programmers-palettes>

an extensive suppliment to gimp-palettes by [@denilsonsa][denilsonsa]

<https://github.com/denilsonsa/gimp-palettes>

----

# Shell Script Utilities

This folder contains the command line executables that manipulate data output to files using the contents of ../templates/* . Those files are used to build the output for the website, either manually or through some form of automation.

Current utilities (in order of use):
* assist
    * as-capitalised-words.sh - used to generate "Caps Words" from "caps words"
* gpl2dec24-all-txt.sh - generate all decimal 24bit RGB colors in various text formats
    * update-gpl2dec24-space-lst.sh - space aligned decimal RGB list (can generate .gpl from these)
    * update-gpl2dec24-space-comma-txt.sh - space aligned comma seperated decimal RGB values (easy to read)
    * update-gpl2dec24-comma-txt.sh - comma seperated decimal RGB values (compact, eg. CSS rgb() arguments)
    * update-gpl2dec24-comma-space-txt.sh - comma seperated space formated decimal RGB values (eg. C argument list)
    * update-gpl2dec24-space-txt.sh - space seperated decimal RGB values (used to generate other palette formats)
* gpl2hex24-all-txt.sh - generate all hexadecimal 24bit RGB colors in various text formats
    * update-gpl2hex24-space-txt.sh - space seperated 8bit byte RGB hex values (used to generate other palette/RGBA formats)
    * update-gpl2hex24-txt.sh - 24bit byte RGB hex values
    * update-gpl2hex24-html-txt.sh - 6 character HTML #RGB hex values
* gpl2names-all-txt.sh
    * update-gpl2names-lst.sh - raw dump of GiMP palette mouse over text (formated "number - name" lowercase)
    * update-gpl2names-official-txt.sh - color names of GiMP palette mouse over text (lowercase space seperated text)
    * update-gpl2names-lower_-txt.sh - lowercase underscore seperated color names
    * update-gpl2names-CAPS_-txt.sh - CAPITALIZED underscore seperated color names (useful as defines or in shell scripts)
    * update-gpl2names-CAPS-txt.sh - CAPITALIZED, no spaces (useful in shell scripts)
    * update-gpl2names-Caps-space-txt.sh - Capialized space seperated color names
    * update-gpl2names-cCaps-txt.sh - compacted, cCapsColor names (useful as variable names in programs)
* gpl2palette-files.sh
    * update-gpl2grafx2.pal.sh - generates 256 JASC palette for Grafx2 (or Graphics Gale)
    * update-gpl2paint.net.sh - generates Paint.Net palette files (optionally with names and numbers, if present in .gpl)

----

# Current files (example):

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
