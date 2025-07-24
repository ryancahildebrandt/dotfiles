# ~/.config/fish/fzf_conf.fish

export FZF_DEFAULT_COMMAND="fd --hidden --type file"
#export FZF_DEFAULT_COMMAND="rg --files --hidden"
export FZF_DEFAULT_OPTS="--height 50% --reverse --border --inline-info --preview='bat --color=always --style=numbers --line-range=:50 {}'"

#fzf
function fish_user_key_bindings
    if command -s fzf-share >/dev/null
        source (fzf-share)/key-bindings.fish
    end

    fzf_key_bindings
end
