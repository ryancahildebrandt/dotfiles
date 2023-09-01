export QT_QPA_PLATFORMTHEME="qt5ct"
export EDITOR=/usr/bin/micro
export GTK2_RC_FILES="$HOME/.gtkrc-2.0"
# fix "xdg-open fork-bomb" export your preferred browser from here
export BROWSER=/usr/bin/firefox
export PATH=/home/ryan/miniconda3/condabin:/home/ryan/.local/bin:/usr/local/bin:/usr/bin:/bin:/usr/local/sbin:/usr/bin/site_perl:/usr/bin/vendor_perl:/usr/bin/core_perl:/var/lib/snapd/snap/bin:~/.config/rofi/bin:~/.local/bin:home/ryan/julia/bin
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
