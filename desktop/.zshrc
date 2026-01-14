
. "$HOME/.local/bin/env"

. "$HOME/.atuin/bin/env"

eval "$(atuin init zsh)"

# >>> juliaup initialize >>>

# !! Contents within this block are managed by juliaup !!

path=('/home/ryan/.juliaup/bin' $path)
export PATH

# <<< juliaup initialize <<<
