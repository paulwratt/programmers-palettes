#!/bin/sh
# generated by:
#  programmers-palettes
#  txt2xterm.colors.sh
#  https://github.com/paulwratt/programmers-palettes/tree/master/bin

if echo "$TERM" | grep "xterm" > /dev/null; then
    # Arne16v20 8 color palette
    t_SETCOLOR='\033]4;%d;rgb:%s';  # for printf
    # xterm-color256: xterm screen rxvt urxtv gnome lxterminal tmux
    # xterm uses hexidecimal values in tput/ESC codes for 256 colors
    t_COLOR0="00/00/00";        t_VOID="00/00/00";
    t_COLOR1="9d/9d/9d";        t_GREY="9d/9d/9d";
    t_COLOR2="ff/ff/ff";        t_WHITE="ff/ff/ff";
    t_COLOR3="be/26/33";        t_RED="be/26/33";
    t_COLOR4="e0/6f/8b";        t_MEAT="e0/6f/8b";
    t_COLOR5="49/3c/2b";        t_DARK_BROWN="49/3c/2b";
    t_COLOR6="a4/64/22";        t_BROWN="a4/64/22";
    t_COLOR7="eb/89/25";        t_ORANGE="eb/89/25";
    ="f7/e2/6b";                t_YELLOW="f7/e2/6b";
    ="2f/48/4e";                t_DARK_GREEN="2f/48/4e";
    ="44/89/1a";                t_GREEN="44/89/1a";
    ="a3/ce/27";                t_SLIME_GREEN="a3/ce/27";
    ="1b/26/32";                t_NIGHT_BLUE="1b/26/32";
    ="00/57/89";                t_SEA_BLUE="00/57/89";
    ="31/a2/f2";                t_SKY_BLUE="31/a2/f2";
    ="b2/dc/ef";                t_CLOUD_BLUE="b2/dc/ef";
fi