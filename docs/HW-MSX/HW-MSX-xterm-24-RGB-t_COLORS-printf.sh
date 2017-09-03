  if [ "$TERM" ="xterm" ]; then
    t_SETCOLOR='\033]4;%d;rgb:%s';  # for printf
    # xterm-color256: xterm screen rxvt urxvt gnome lxterminal tmux
    # xterm uses hexidecimal values in tput/ESC codes for 256 colors
    t_COLOR0="00/00/00"; t_TRANSPARENT="00/00/00"; 
    t_COLOR1="01/01/01"; t_BLACK="01/01/01"; 
    t_COLOR2="3e/b8/49"; t_MEDIUM_GREEN="3e/b8/49"; 
    t_COLOR3="74/d0/7d"; t_LIGHT_GREEN="74/d0/7d"; 
    t_COLOR4="59/55/e0"; t_DARK_BLUE="59/55/e0"; 
    t_COLOR5="80/76/f1"; t_LIGHT_BLUE="80/76/f1"; 
    t_COLOR6="b9/5e/51"; t_DARK_RED="b9/5e/51"; 
    t_COLOR7="65/db/ef"; t_CYAN="65/db/ef"; 
    t_COLOR8="db/65/59"; t_MEDIUM_RED="db/65/59"; 
    t_COLOR9="ff/89/7d"; t_LIGHT_RED="ff/89/7d"; 
    t_COLOR10="cc/c3/5e"; t_DARK_YELLOW="cc/c3/5e"; 
    t_COLOR11="de/d0/87"; t_LIGHT_YELLOW="de/d0/87"; 
    t_COLOR12="3a/a2/41"; t_DARK_GREEN="3a/a2/41"; 
    t_COLOR13="b7/66/b5"; t_MAGENTA="b7/66/b5"; 
    t_COLOR14="cc/cc/cc"; t_GRAY="cc/cc/cc"; 
    t_COLOR15="ff/ff/ff"; t_WHITE="ff/ff/ff";  
  fi
