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
alias gss="find . -name .git -type d -execdir sh -c 'pwd ;git status; echo "------------"; echo' \;"
alias cbx="cbonsai -li --time .1 --life 50 --leaf {あ,い,う,え,お}"
alias jh="cd ~"
alias tx="tmux"
alias m="micro"

# >>> conda initialize >>> 
# !! Contents within this block are managed by 'conda init' !! 
eval /home/ryan/miniconda3/bin/conda "shell.fish" "hook" $argv | source 
# <<< conda initialize <<< 
conda deactivate

#autojump
[ -f /usr/share/autojump/autojump.fish ]; and source /usr/share/autojump/autojump.fish

#external commands/config
source ~/.config/fish/private_commands.fish
source ~/.config/nnn/nnn_conf.fish
source ~/github/blanks/commands.fish
