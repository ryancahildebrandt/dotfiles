# ~/.config/fish/config.fish
# Fish options 
#starship init fish | source
zoxide init --cmd j fish | source
starship init fish --print-full-init | sed 's/"$(commandline)"/(commandline | string collect)/' | source
fish_add_path ~/.local/bin ~/.cargo/bin /usr/local/bin /usr/bin /bin /usr/local ~/.yarn/bin
# set -U fish_greeting ""

# Custom aliases
alias sf="source ~/.config/fish/config.fish"
alias lx="ls -1AFhs --color --group-directories-first"
alias gs="git status"
alias jh="cd ~"
alias tx="tmux"
alias ff="fzf"
alias xx="exit"
alias m="micro"
alias y="yazi"
alias bat="batcat"
alias ee="exa -GlFa --icons --group-directories-first"
alias rc="ruff check"
alias rf="ruff format"
alias duck="~/duckdb"
alias cpruff="cp ~/ruff.toml ./ruff.toml"
alias h="hx"
alias v="nvim"
alias fullup="sudo apt update && sudo apt full-upgrade && sudo apt dist-upgrade && sudo apt autoremove && sudo apt autoclean"
alias z="zellij"
