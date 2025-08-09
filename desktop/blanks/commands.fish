#~/github/blanks/commands.fish
#shell commands accompanying r/py blank files
#written for fish shell

alias new_py="date | xargs -I {} sed 's/DOW MMM DD HH:MM:SS YYYY/{}/g' ~/github/dotfiles/desktop/blanks/py_blank.txt"
alias new_r="date | xargs -I {} sed 's/DOW MMM DD HH:MM:SS YYYY/{}/g' ~/github/dotfiles/desktop/blanks/r_blank.txt"
alias new_jl="date | xargs -I {} sed 's/DOW MMM DD HH:MM:SS YYYY/{}/g' ~/github/dotfiles/desktop/blanks/jl_blank.txt"
alias new_md="date | xargs -I {} sed 's/DOW MMM DD HH:MM:SS YYYY/{}/g' ~/github/dotfiles/desktop/blanks/md_blank.txt"
alias new_rb="date | xargs -I {} sed 's/DOW MMM DD HH:MM:SS YYYY/{}/g' ~/github/dotfiles/desktop/blanks/rb_blank.txt"
alias new_go="date | xargs -I {} sed 's/DOW MMM DD HH:MM:SS YYYY/{}/g' ~/github/dotfiles/desktop/blanks/go_blank.txt"

#Usage

#$ new_py > a_new_file.py
