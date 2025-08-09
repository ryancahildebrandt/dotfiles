# ~/.config/fish/config.fish

# Fish options 
zoxide init --cmd j fish | source
starship init fish | source

# Custom aliases
alias lx="ls -1AFhs --color --group-directories-first"
alias ee="exa -laGF --icons --group-directories-first"
alias sf="source ~/.config/fish/config.fish"
alias gs="git status"
alias gss="find . -name .git -type d -execdir sh -c 'pwd ;git status; echo "------------"; echo' \;"
alias gsp="find . -name .git -type d -execdir sh -c 'pwd ;git pull; echo "------------"; echo' \;"
alias cbx="cbonsai -li --time .1 --life 50 --leaf {あ,い,う,え,お}"
alias jh="cd ~"
alias tx="tmux"
alias m="micro"
alias xx="exit"
alias bc="eva"
alias nv="navi"
alias duck="~/duckdb"
alias ff="fzf"
alias y="yazi"
alias nxu="sudo nix-channel --update"
alias nxs="sudo nixos-rebuild --upgrade switch"
alias nxb="sudo nixos-rebuild --upgrade boot"
alias nxt="sudo nixos-rebuild --upgrade test"
alias nxd="sudo nix-collect-garbage -d"
alias z="zellij"

#external commands/config
source ~/.config/fish/private_commands.fish
source ~/.config/fzf/fzf_conf.fish
source ~/github/dotfiles/laptop/blanks/commands.fish
