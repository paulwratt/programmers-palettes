  if [ "$TERM" ="fbterm" ]; then
    t_SETCOLOR='\033[3;%d;%s}';  # for printf
    # fbterm uses decimal values in tput/ESC codes for 256 colors
    # color 0 is the transparency color (cat img.fbimg > /dev/fb0)
    t_COLOR0="0;0;0";        t_TRANSPARENT="0;0;0"; 
    t_COLOR1="1;1;1";        t_BLACK="1;1;1"; 
    t_COLOR2="62;184;73";    t_MEDIUM_GREEN="62;184;73"; 
    t_COLOR3="116;208;125";  t_LIGHT_GREEN="116;208;125"; 
    t_COLOR4="89;85;224";    t_DARK_BLUE="89;85;224"; 
    t_COLOR5="128;118;241";  t_LIGHT_BLUE="128;118;241"; 
    t_COLOR6="185;94;81";    t_DARK_RED="185;94;81"; 
    t_COLOR7="101;219;239";  t_CYAN="101;219;239"; 
    t_COLOR8="219;101;89";   t_MEDIUM_RED="219;101;89"; 
    t_COLOR9="255;137;125";  t_LIGHT_RED="255;137;125"; 
    t_COLOR10="204;195;94";  t_DARK_YELLOW="204;195;94"; 
    t_COLOR11="222;208;135"; t_LIGHT_YELLOW="222;208;135"; 
    t_COLOR12="58;162;65";   t_DARK_GREEN="58;162;65"; 
    t_COLOR13="183;102;181"; t_MAGENTA="183;102;181"; 
    t_COLOR14="204;204;204"; t_GRAY="204;204;204"; 
    t_COLOR15="255;255;255"; t_WHITE="255;255;255";  
  fi
