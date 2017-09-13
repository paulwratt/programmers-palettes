# Programmers Palettes

preview:
http://paulwratt.github.io/programmers-palettes/

palettes for programmers, developers, and designers.

https://github.com/paulwratt/programmers-palettes/tree/master/docs

an extensive suppliment to [gimp-palettes][gimp-preview] by [@denilsonsa][denilsonsa]

<https://github.com/denilsonsa/gimp-palettes>

----

# Shell Script Utilities

This folder contains the shell script executables that manipulate data output to files based on the contents of ../templates/* . The resulting files are used to build the output for the website, gerenate different palettes and RGBA formats, either manually or through some form of automation.

Current utilities (in order of use):
* assist
    * ** as-capitalised-words.sh** - used to generate "Caps Words" from "caps words"
* gpl2dec24-all-txt.sh
    * **update-gpl2dec24-space-lst.sh** - space aligned decimal RGB list (can generate .gpl from these)
    * **update-gpl2dec24-space-comma-txt.sh** - space aligned comma seperated decimal RGB values (easy to read)
    * **update-gpl2dec24-comma-txt.sh** - comma seperated decimal RGB values (compact, eg. CSS rgb() arguments)
    * **update-gpl2dec24-comma-space-txt.sh** - comma seperated spaced decimal RGB values (eg. C argument list)
    * **update-gpl2dec24-space-txt.sh** - space seperated decimal RGB values (used to generate another palette/format)
* gpl2hex24-all-txt.sh
    * **update-gpl2hex24-printf-txt.sh** - printf RGB hex values for printf functions
    * **update-gpl2hex24-space-txt.sh** - space seperated 8bit byte RGB hex values (used to generate other RGBA formats)
    * **update-gpl2hex24-0x-comma-space-txt.sh** - space seperated 8bit byte RGB hex values (used to generate other RGBA formats)
    * **update-gpl2hex24-txt.sh** - 24bit word RGB hex values
    * **update-gpl2hex24-html-txt.sh** - 6 digit HTML #RRGGBB hex values
    * **update-gpl2hex24-CAPS-space-txt.sh** - capitalized space seperated 8bit byte RGB hex values (used to generate another palette/format)
    * **update-gpl2hex24-CAPS-txt.sh** - capitalized 24bit word RGB hex values
    * **update-gpl2hex24-CAPS-forward-slash.sh** - capitalized 24bit word RGB hex xterm ESC sequences
    * **update-gpl2hex24-printf-CAPS-txt.sh** - capitalized printf RGB hex values for printf functions
    * **update-gpl2hex32-printf-CAPS-BGRA-txt.sh** - capitalized printf BGRA8888 hex values for printf functions
    * **update-gpl2hex32-printf-CAPS-RGBA-txt.sh** - capitalized printf RGBA8888 hex values for printf functions
* gpl2names-all-txt.sh
    * **update-gpl2names-lst.sh** - raw dump of GiMP palette mouse over text (formated "number - name" lowercase)
    * **update-gpl2names-official-txt.sh** - lowercase space seperated text color names (from GiMP palette)
    * **update-gpl2names-lower_-txt.sh** - lower_case color names
    * **update-gpl2names-CAPS_-txt.sh** - CAPITAL_IZED color names (useful as defines or in shell scripts)
    * **update-gpl2names-CAPS-txt.sh** - CAPITALIZED, no spaces (useful in shell scripts)
    * **update-gpl2names-Caps-space-txt.sh** - Capialized Space Seperated color names
    * **update-gpl2names-cCaps-txt.sh** - cCapsColor compacted names (useful as variable names in programs)
* gpl2palette-files.sh
    * **update-gpl2grafx2.pal.sh** - generates 256 JASC palette for Grafx2 (or Graphics Gale)
    * **update-gpl2paint.net.sh** - generates Paint.Net palette files (optionally with names and numbers, if present in .gpl)
    * **update-txt2BAS.COLORS.sh** - generates ShellBASIC PSET/PRESET (Bas) palette file (fbterm + xterm + 32bit BGRA printf for framebuffer)
    * **update-txt2bas.colors.bas.sh** - generates ANSI BASIC (.bas) palette file (fbterm + xterm + 32bit BGRA printf for framebuffer)
* txt2C-all-h.sh
    * **update-txt2C-dec-RGB-array-h.sh** - generates decimal RGB array
    * **update-txt2C-hex-RGB-array-h.sh** - generates hexadecimal RGB array
    * **update-txt2C-names-array-h.sh** - generates color names array
    * **update-txt2C-printf-RGB-array-h.sh** - generates hexadecimal RGB printf array
    * **update-C2C-cNames-printf-RGB-list-h.sh** - gererate cColorNames hexadecimal printf list
    * **update-C2C-names-dec-RGB-arrays-h.sh** - makes color names array and decimal RGB array in one file
    * **update-C2C-names-hex-RGB-arrays-h.sh** - makes color names array and hexadecimal RGB array in one file


[denilsonsa]: https://github.com/denilsonsa
[gimp-preview]: http://denilsonsa.github.io/gimp-palettes/index.html
