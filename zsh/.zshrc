# Generic Aliases {{{

alias copy='xclip -selection clipboard'
alias paste='xclip -selection clipboard -o'
alias vimt="vim '+TddTarget test:1.0'"
alias bp='(paplay /usr/share/sounds/KDE-Im-Message-In.ogg &) &> /dev/null'
alias ll='ls -alF'
alias ginit='git init; git commit --allow-empty -m "initial commit";'
alias make='nocorrect make'

# }}}
# New Functions {{{

# Rename the terminal's title
rename() {
    echo -ne "\033]0;$1\007";
}

# Swap two files
function swap() {
    local TMPFILE=tmp.$$
    mv "$1" $TMPFILE
    mv "$2" "$1"
    mv $TMPFILE "$2"
}

# }}}
# Qisues Shortcuts {{{

alias qi='qissues'
alias cq='clear; qissues'
alias qiswap='swap .qissues .qissues-secondary'

function qic() {
    qissues create -d "title=$1"
}

# }}}
# ZSH Setup {{{

ZSH=$HOME/.oh-my-zsh
ZSH_THEME="adrian"

DISABLE_AUTO_UPDATE="true"
DISABLE_AUTO_TITLE="true"
plugins=(git git-extras history node npm symfony2 tmux)

source $ZSH/oh-my-zsh.sh
export PATH=$PATH:./node_modules/.bin:/home/adrian/bin:/usr/lib/lightdm/lightdm:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games

# }}}
