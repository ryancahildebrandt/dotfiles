# ~/.config/fish/config.fish

# Fish options 
starship init fish | source
set PATH ~/miniconda3/bin $PATH
set fish_user_paths ~/miniconda3/bin $fish_user_paths
set -U fish_greeting "
   °
    O     /`·.¸
  0      /¸...¸`:·
   o ¸.·´  ¸   `·.¸.·´)
    : © ):´;      ¸  {
     `·.¸ `·  ¸.·´\`·¸)
         `\\´´\¸.·´

〜　フ　ィ　ッ　シ　ュ　タ　イ　ム　〜

"

# Custom aliases
alias lx="ls -1AFhs --color --group-directories-first" 
alias nx="natls -gln" 
#alias bat="batcat" 
alias kboff="xinput float 10" 
alias kbon="xinput reattach 10 3" 
alias nomachine="/usr/NX/bin/nxplayer" 
alias mouse_reset="sudo rmmod psmouse; sudo modprobe psmouse" 
alias gs="git status" 
alias sf="source ~/.config/fish/config.fish" 
alias new_py="date | xargs -I {} sed 's/DOW MMM DD HH:MM:SS YYYY/{}/g' ~/github/blanks/py_blank.txt" 
alias new_r="date | xargs -I {} sed 's/DOW MMM DD HH:MM:SS YYYY/{}/g' ~/github/blanks/r_blank.txt"
alias new_jl="date | xargs -I {} sed 's/DOW MMM DD HH:MM:SS YYYY/{}/g' ~/github/blanks/jl_blank.txt"
alias nnn="nnn -dHo" 
alias gss="find . -name .git -type d -execdir sh -c 'pwd ;git status; echo "------------"; echo' \;"
alias cbx="cbonsai -li --time .1 --life 50 --leaf {あ,い,う,え,お}"

# nnn Nord Theme 
set BLK "0B" CHR="0B" DIR="04" EXE="06" REG="00" HARDLINK="06" SYMLINK="06" MISSING="00" ORPHAN="09" FIFO="06" SOCK="0B" OTHER="06"
set NNN_FCOLORS "$BLK$CHR$DIR$EXE$REG$HARDLINK$SYMLINK$MISSING$ORPHAN$FIFO$SOCK$OTHER" 

# >>> conda initialize >>> 
# !! Contents within this block are managed by 'conda init' !! 
eval /home/ryan/miniconda3/bin/conda "shell.fish" "hook" $argv | source 
# <<< conda initialize <<< 

conda deactivate

source ~/.config/fish/private_commands.fish