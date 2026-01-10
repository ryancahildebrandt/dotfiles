# ~/.config/fish/config.fish

# Fish options 
fish_add_path ~/julia/bin ~/.juliaup/bin ~/.local/bin ~/.local/share ~/.local/share/gem/ruby ~/.cargo/bin ~/exercism/bin ~/.local/bin/qobuz-dl /root/.cargo/bin ~/go/bin /usr/bin/ruby /usr/bin/npm /usr/bin/node ~/.rbenv/bin ~/zig ~/.atuin/bin

zoxide init --cmd j fish | source
atuin init fish | source
# starship init fish | source
oh-my-posh init fish --config "gruvbox" | source

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
alias cbx="cbonsai -li --time .1 --life 50 --leaf {あ,い,う,え,お}"
alias jh="cd ~"
alias tx="tmux"
alias m="micro"
alias xx="exit"
alias nv="navi"
alias nvp="navi --print"
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
alias v="nvim"
alias h="hx"
alias lg="lazygit"
alias z="zellij"
alias gt="gotests -w --all --excl=New --template_dir=/home/ryan/github/gotests/templates/testify"
alias lstr="lstr -saG --icons --level=2"

#external commands/config
source ~/.config/fish/private_commands.fish
source ~/.config/fzf/fzf_conf.fish
source ~/.config/yazi/wrapper.fish

# Added by `rbenv init` on Thu Aug 14 07:39:25 PM EDT 2025
status --is-interactive; and ~/.rbenv/bin/rbenv init - --no-rehash fish | source
