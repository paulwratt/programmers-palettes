# Programmers Palettes
palettes for programmers, developers, and designers.

<https://github.com/paulwratt/programmers-palettes>

Color name and hue:

<http://www.color-blindness.com/color-name-hue/>

----

# Short color names

Where no color names are defined in the GiMP palette, or in the reference source, for simplicity (see effort below), and used as variable names "only for that palette". When used with other palettes, they should be prefixed with the value noted in the GiMP palette file, or use the 'approx-names', or the short form of 'long-names', any are valid.

----

# Long color names

GiMP palettes, especially custom 16 color, or optimized 16 color, without color names are extremely hard to accurately name. Using the above url, with visual verification of the actual color compared to the nearest color (name) in that hue (red, orange, yellow, green, blue, violet, brown, black, grey, and white), I used the following algorithm to accurately describe the color, which should be unique when compared to another hand named palette (by programmers-palettes). Unfortunately this does make them somewhat unusable as variable names, but hey, no one else took the time, so ..

(light=>name)(looks_like|hue-ish)(variation)(most_like)
(name)(looks_like|hue-ish)(variation)(most_like)
(dark=>name)(looks_like|hue-ish)(variation)(most_like)
if !(light=>name) && !(dark=>name) && !(name) then (bright=>name) || (pale=>name)

In (most_like) where 'gray' is on the darker/black side and 'grey' is on the lighter/white side

Examples:
* #4e4a4e - dark liver brown dark gray
* #442434 - castro dark burgandy red dark brown
* #30346d - dark torea bay violet dark blue

----

# Short form of Long Names

(name) (from above) or
(approx-name) or
(prefix)(official-name) (short names by programmers-palettes)

----

NOTE:
One url I did want to try (at the Canadian Genome Science Center) is currently broken (8,332 names), but it weights the color names plus or minus 3-5 each side of your color, and does not drop duplicate names (for a specific HTML color). Technically that should allow to produce a shorter more unique name for your color.

<http://mkweb.bcgsc.ca/colornames/>

""
SOURCES

My list uses the following sources: bang-v2, beer SRM chart, colorhexa, crayola, n3, ntc, raveling, resene, rgb.txt (X11), steve.hollasch, wikipedia, and xkcd. Entries without a link can be found at this page of color name lists.
""

<http://www.franklinbrew.org/wp/?page_id=144>
<http://www.colorhexa.com/color-names>
<https://en.wikipedia.org/wiki/List_of_colors_(compact)>
<https://xkcd.com/color/rgb/>
<https://people.csail.mit.edu/jaffer/Color/Dictionaries#The Dictionaries>

""
WHAT'S NOT INCLUDED

Pantone colors are not included in this list. For now.
Neither are names of paint colors, which tend to be frivolous. In fact, frivolous is a color name assigned by Olympic for #329DB2 (cyan). See, not that useful.

That's not to say that there aren't ridiculous names in the list. #C7031E (red) is monza, found on the resene and "name that color" lists. You have been warned.
""

The color names list and its archive are in the templates directory (30-Sep-2017)


