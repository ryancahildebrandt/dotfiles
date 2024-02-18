# ~/.config/fish/config.fish

# Fish options 
starship init fish | source
#fish_add_path ~/miniconda3/bin ~/julia/bin ~/.juliaup/bin 
#set -U fish_greeting "
#   °
#    O     /`·.¸
#  0      /¸...¸`:·
#   o ¸.·´  ¸   `·.¸.·´)
#    : © ):´;      ¸  {
#     `·.¸ `·  ¸.·´\`·¸)
#         `\\´´\¸.·´
#
#〜　フ　ィ　ッ　シ　ュ　タ　イ　ム　〜
#
#"

# Custom aliases
alias lx="ls -1AFhs --color --group-directories-first"
alias ee="exa -laGF --icons --group-directories-first"
#alias kboff="xinput float 10" 
#alias kbon="xinput reattach 10 3" 
#alias nomachine="/usr/NX/bin/nxplayer" 
#alias mouse_reset="sudo rmmod psmouse; sudo modprobe psmouse" 
alias gs="git status"
alias sf="source ~/.config/fish/config.fish"
alias gss="find . -name .git -type d -execdir sh -c 'pwd ;git status; echo "------------"; echo' \;"
alias gsp="find . -name .git -type d -execdir sh -c 'pwd ;git pull; echo "------------"; echo' \;"
alias cbx="cbonsai -li --time .1 --life 50 --leaf {あ,い,う,え,お}"
alias jh="cd ~"
alias tx="tmux"
alias m="micro"
alias xx="exit"
alias tt="tldr"
alias duck="~/duckdb"
#alias flash="~/github/fla.sh/flash"
alias nxu="sudo nix-channel --update"
alias nxs="sudo nixos-rebuild switch"
alias nxb="sudo nixos-rebuild boot"
alias nxt="sudo nixos-rebuild test"

# >>> conda initialize >>> 
# !! Contents within this block are managed by 'conda init' !! 
#eval /home/ryan/miniconda3/bin/conda "shell.fish" "hook" $argv | source 
# <<< conda initialize <<< 
#conda deactivate

#autojump
if test -f /home/ryan/.autojump/share/autojump/autojump.fish
    . /home/ryan/.autojump/share/autojump/autojump.fish
end

#external commands/config
source ~/.config/fish/private_commands.fish
source ~/.config/nnn/nnn_conf.fish
source ~/.config/fzf/fzf_conf.fish
source ~/github/dotfiles/blanks/commands.fish

# on start
#neofetch
