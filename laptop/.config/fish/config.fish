# ~/.config/fish/config.fish

# Fish options 
fish_add_path ~/.local/bin

zoxide init --cmd j fish | source
# starship init fish | source
oh-my-posh init fish --config "gruvbox" | source

# Custom aliases
alias lx="ls -1AFhs --color --group-directories-first"
alias ee="exa -laGF --icons --group-directories-first"
alias sf="source ~/.config/fish/config.fish"
alias gs="git status"
alias gss="find . -name .git -type d -execdir sh -c 'pwd ;git status; echo "------------"; echo' \;"
alias gsp="find . -name .git -type d -execdir sh -c 'pwd ;git pull; echo "------------"; echo' \;"
alias jh="cd ~"
alias tx="tmux"
alias m="micro"
alias xx="exit"
alias bc="eva"
alias nv="navi"
alias duck="~/duckdb"
alias ff="fzf"
alias y="yazi"
alias vpnconnect="sudo openvpn --config /etc/openvpn/client2.conf -d"

#external commands/config
source ~/github/dotfiles/laptop/blanks/commands.fish

