# Programmers Palettes

preview:
http://paulwratt.github.io/programmers-palettes/

palettes for programmers, developers, and designers.

https://github.com/paulwratt/programmers-palettes/tree/master/docs

an extensive suppliment to [gimp-palettes][gimp-preview] by [@denilsonsa][denilsonsa]

<https://github.com/denilsonsa/gimp-palettes>

----

The aim of _programmers-palettes_ is to suppliment, not surplant, [@denilsonsa][denilsonsa]'s [gimp-palette][gimp-preview], with lists in html that can be copied or downloaded for various purposes, including SH scripts (xterm, fbterm), C/C++ arrays (names, decimal values), printf escape strings, framebuffer bytes, various palette formats, and hardware palettes. Eventually I will also add examples of what to do with them, like:

* use 256 colors in [Bas][] BASIC programs (Michael Haardt, creator of [CPMtools][])
* how to convert palettes to native hardware palette data (eg. MSX2 VDP registers)
* how to convert images to native fixed palette data (sprite/tile data, or screen image)

Versions are tagged date encoded with **one (1) _set_**. If I get 30 _sets_ in one day, I'll look at modifying the tagging.

* palettes:
    * **170903-HW-MSX** (16 color palette)
    * **170925 HW-CGA** (16 color palette)
    * **(next)-Arne16v20** (customised Commodore 64 style restricted palette)
* TODO:
    * (later) DawnBringer16 (16 32bit color restricted palette)
    * (later) DawnBringer32 (32 32bit color restricted palette)
    * (later) Pantone (256 color palette)
    * (later) HW-Atari-ST (16 color default palette)
    * (later) HW-Atari-Falcon (256 color default palette)
    * (later) HW-Atari-ST-alt (256 color alternate or common palette)
    * (later) HW-Atari-STE-512 (512 color default palette)
* future:
    * (after) HW-Amstrad-CPC (23 color palette)
    * (after) HW-Apple-II (16 color palette)
    * (after) HW-Commodore-64 (16 color palette)
    * (after) HW-ZX-Spectrum (8 color palette)

Unfortunately, at the moment, without automation, each _set_ takes about three (3) days (for the full _set_ of useful data in HTML lists and file formats), and since the reason for creating them is to actually use different parts in various code projects I am working on, each _set_ will come as I need them. So until I have some automation tools, and some more templates, they will only be added as I need them. Submissions are welcome, use **HW-MSX** as a basic example, **DawnBringer32** as an alternative (with included image examples - _NOTE not done yet_). Please dont make pull requests for a partial _set_ or multiple _sets_. If its a full _set_ I will make a _TAG_ release (linked from previewer).

----

For an individual palette, all .HTML files print the same palette preview for the same name as found on [gimp-palette preview][gimp-preview] page, display the same information as in the files, and their entire list (column) can copied from the web browser.

For currently available formats an files see: [./FORMATS.md][formats]

For currently available _sets_ that are linked from the previewer (if they have all files needed), and unlinked sets I am still working on:

<https://github.com/paulwratt/programmers-palettes/tree/master/docs> 

[denilsonsa]: https://github.com/denilsonsa
[gimp-preview]: http://denilsonsa.github.io/gimp-palettes/index.html
[bas]: http://www.moria.de/~michael/bas/
[cpmtools]: http://www.moria.de/~michael/cpmtools/
[formats]: https://github.com/paulwratt/programmers-palettes/blob/master/FORMATS.md