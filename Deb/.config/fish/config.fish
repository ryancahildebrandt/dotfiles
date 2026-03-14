# ~/.config/fish/config.fish

# Fish options 
fish_add_path ~/.local/bin ~/.local/share ~/.local/share/gem/ruby ~/.cargo/bin /root/.cargo/bin ~/go/bin /usr/bin/ruby ~/.rbenv/bin ~/.atuin/bin

zoxide init --cmd j fish | source
atuin init fish | source
# starship init fish | source
oh-my-posh init fish --config "gruvbox" | source
set -U fish_greeting

# Custom aliases
alias lx="ls -1AFhs --color --group-directories-first"
alias ee="exa -GlFa --icons --group-directories-first"
alias bat="batcat"
alias gs="git status"
alias sf="source ~/.config/fish/config.fish"
alias jh="cd ~"
alias tx="tmux"
alias m="micro"
alias xx="exit"
alias duck="duckdb"
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
alias z="zellij"
alias gt="gotests -iw --use_go_cmp --all --excl=New --template_dir=/home/ryan/code/gotests/templates/testify"
alias lstr="lstr -saG --icons --level=2"
alias f="flow"

#external commands/config
source ~/.config/fzf/fzf_conf.fish
source ~/.config/yazi/wrapper.fish
