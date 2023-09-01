# ~/.config/nnn/nnn_conf.fish
export NNN_OPTS="Deo"
export NNN_PLUG='b:!bat $nnn;m:!micro $nnn;d:dragdrop;p:preview-tui;v:imgview;u:getplugs;r:renamer;j:autojump'
export NNN_FIFO="/tmp/nnn.fifo"

set BLK "0B" 
set CHR "0B" 
set DIR "04" 
set EXE "06" 
set REG "00" 
set HARDLINK "06" 
set SYMLINK "06" 
set MISSING "00" 
set ORPHAN "09" 
set FIFO "06" 
set SOCK "0B" 
set OTHER "06"

set NNN_FCOLORS "$BLK$CHR$DIR$EXE$REG$HARDLINK$SYMLINK$MISSING$ORPHAN$FIFO$SOCK$OTHER"
