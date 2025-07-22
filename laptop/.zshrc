#sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
fpath+=($HOME/.zsh/pure)
export ZSH=$HOME/.oh-my-zsh
source $ZSH/oh-my-zsh.sh
plugins=(branch colorize fzf git-prompt ripgrep sublime tmux zsh-interactive-cd)
#source <(fzf --zsh)
#source zsh-interactive-cd.plugin.zsh
#azure
#gcloud

# The following lines were added by compinstall
zstyle :compinstall filename '/home/ryan/.zshrc'

autoload -Uz compinit
compinit
autoload -U promptinit
promptinit
prompt pure
# End of lines added by compinstall
# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
bindkey -e
# End of lines configured by zsh-newuser-install

alias lx="ls -1AFhs --color --group-directories-first"
alias gs="git status"
alias jh="cd ~"
alias tx="tmux"
alias ff="fzf"
alias fd="fdfind"
