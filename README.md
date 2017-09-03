# Programmers Palettes
preview:

<http://paulwratt.github.io/programmers-palettes/>

palettes for programmers, developers, and designers.

<https://github.com/paulwratt/programmers-palettes/tree/master/docs>

an extensive suppliment to gimp-palettes by [@denilsonsa][denilsonsa]

<https://github.com/denilsonsa/gimp-palettes>

----

The aim of _programmers-palettes_ is to suppliment, not surplant, [@denilsonsa][denilsonsa]'s [gimp-palette][gimp-preview], with html lists that can be copied or downloaded for various purposes, including SH scripts (xterm, fbterm), C/C++ arrays (names, decimal values), and printf escape strings, amongst other uses. Eventually I will also add examples of what to do with them, like:

* use 256 colors in [Bas][] BASIC programs (Michael Haardt, creator of [CPMtools][])
* how to convert palettes to native hardware palette data (eg. MSX2 VDP registers)
* how to convert images to native fixed palette data (sprite/tile data, or screen image)

Versions are tagged date encoded with **one (1) _set_**. If I get 30 _sets_ in one day, I'll look at modifying the tagging.

* palettes:
    * HW-MSX (16 color palette) (tag: 170903-HW-MSX)
* TODO:
    * (next) HW-CGA (16 color palette)
    * (later) DawnBringer16 (16 32bit color restricted palette)
    * (later) DawnBringer32 (32 32bit color restricted palette)
    * (later) Pantone (256 color palette)
    * (later) HW-Atari-ST (256 color default palette)
    * (later) HW-Atari-ST-alt (256 color alternate (common) palette)
* future:
    * (after) HW-Amstrad-CPC (23 color palette)
    * (after) HW-Apple-II (16 color palette)

Unfortunately, at the moment, without automation, each _set_ takes about three (3) days, and since the reason for creating them is to actually use different parts in various code projects I am working on, each _set_ will come as I need them. So until I have some automation tools, and some more templates, they will only be added as I need them. Submissions are welcome, use **HW-MSX** as a basic example, **DawnBringer32** as an alternative (with included image examples - _NOTE not done yet_). Please dont make pull requests for a partial _set_ or multiple _sets_. If its a full _set_ I will make a _TAG_ release.

----

For an individual palette, all .HTML files print the same palette preview for the same name as found on [gimp-palette preview][gimp-preview] page, display the same information as in the files, and their entire list (columns) can copied from the web browser.

Current available:

* info (example):
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
[bas]: http://www.moria.de/~michael/bas/
[cpmtools]: http://www.moria.de/~michael/cpmtools/
