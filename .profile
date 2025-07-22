export EDITOR=/usr/bin/micro
export BROWSER=/usr/bin/firefox
export VISUAL=/usr/bin/subl
# >>> juliaup initialize >>>

# !! Contents within this block are managed by juliaup !!

case ":$PATH:" in
    *:/home/ryan/.juliaup/bin:*)
        ;;

    *)
        export PATH=/home/ryan/.juliaup/bin${PATH:+:${PATH}}
        ;;
esac

# <<< juliaup initialize <<<
. "$HOME/.cargo/env"
