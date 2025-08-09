# ~/.config/fish/config.fish

# Fish options 
zoxide init --cmd j fish | source
starship init fish | source
fish_add_path ~/julia/bin ~/.juliaup/bin ~/.local/bin ~/.local/share ~/.local/share/gem/ruby ~/.cargo/bin ~/exercism/bin ~/.local/bin/qobuz-dl /root/.cargo/bin ~/go/bin ~/helix /usr/bin/ruby /usr/bin/npm /usr/bin/node
set -U fish_greeting ""
# °
# O     /`·.¸
# 0      /¸...¸`:·
# o ¸.·´  ¸   `·.¸.·´)
# : © ):´;      ¸  {
# `·.¸ `·  ¸.·´\`·¸)
# `\\´´\¸.·´
# 
# 〜　フ　ィ　ッ　シ　ュ　タ　イ　ム　〜
# 
# "

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
alias nv="navi"
alias nvp="navi --print"
alias duck="~/duckdb"
alias sst="systemctl --user start"
alias ssp="systemctl --user stop"
alias ssr="systemctl --user restart"
alias sss="systemctl --user status"
alias cpruff="cp ~/ruff.toml ./ruff.toml"
alias cpgoci="cp ~/.golangci.yml ./.golangci.yml"
alias rf="ruff format"
alias rc="ruff check"
alias neofetch="macchina"
alias ff="fzf"
alias fd="fdfind"
alias y="yazi"
alias uva="source .venv/bin/activate.fish"
alias uvd="deactivate"
alias v="nvim"
alias h="hx"
alias e="emacs"
alias lg="lazygit"
alias fullup="sudo apt update && sudo apt full-upgrade && sudo apt dist-upgrade && sudo apt autoremove && sudo apt autoclean"
alias z="zellij"

#external commands/config
source ~/.config/fish/private_commands.fish
source ~/.config/fzf/fzf_conf.fish
source ~/github/dotfiles/desktop/blanks/commands.fish
