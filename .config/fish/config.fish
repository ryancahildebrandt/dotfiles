# ~/.config/fish/config.fish

# Fish options 
starship init fish | source
navi widget fish | source
fish_add_path ~/miniconda3/bin ~/julia/bin ~/.juliaup/bin ~/.local/bin ~/.cargo/bin ~/exercism/bin
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
alias ee="exa -GlFa --icons --group-directories-first"
alias bat="batcat" 
alias gs="git status" 
alias sf="source ~/.config/fish/config.fish" 
alias gss="find . -name .git -type d -execdir sh -c 'pwd ;git status; echo "------------"; echo' \;"
alias gsp="find . -name .git -type d -execdir sh -c 'pwd ;git pull; echo "------------"; echo' \;"
alias cbx="cbonsai -li --time .1 --life 50 --leaf {あ,い,う,え,お}"
alias jh="cd ~"
alias tx="tmux"
alias m="micro"
alias xx="exit"
#alias tt="tldr"
alias nv="navi"
alias nvp="navi --print"
alias duck="~/duckdb"
alias sst="systemctl start"
alias ssp="systemctl stop"
alias ssr="systemctl restart"
alias sss="systemctl status"
alias cpruff="cp ~/ruff.toml ./ruff.toml"
alias neofetch="rsftch -o 'Ubuntu'"
alias ff="fzf"
alias fd="fdfind"

# thefuck
eval (thefuck --alias fuck | tr '\n' ';')

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
source ~/.config/fzf/fzf_conf.fish
source ~/github/dotfiles/blanks/commands.fish
bash /usr/share/autojump/autojump.sh

#on start
#neofetch
status --is-interactive; and ~/.rbenv/bin/rbenv init - fish | source
