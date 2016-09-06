# Generic Aliases {{{

alias ~~='~/Projects'
alias copy='xclip -selection clipboard'
alias paste='xclip -selection clipboard -o'
alias vimt="vim '+TddTarget test:1.0'"
alias bp='(playpause_beep &) &> /dev/null'
alias ll='ls -alF'
alias ginit='git init; git commit --allow-empty -m "initial commit";'
alias make='nocorrect make'
alias ccff='make coverage; firefox coverage/index.html'
alias sculp='nodemon -e ".php|.html|.md" -w app -w source --exec "sculpin generate --server"'

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

function playpause_beep() {
    music-pause;
    (paplay /usr/share/sounds/KDE-Im-Message-In.ogg &) &> /dev/null;
    sleep 1;
    music-play;
}

function notify() {
  terminal-notifier -title "Finished Task" -message "Long running task has finished"
}

function attach() {
  TMUX= tmux switch -t $1 || tmuxp load $1.yaml -y
}

# }}}
# ZSH Setup {{{

ZSH=$HOME/.oh-my-zsh
ZSH_THEME="adrian"

DISABLE_AUTO_UPDATE="true"
DISABLE_AUTO_TITLE="true"
unsetopt histverify

plugins=(git git-extras history node npm symfony2 tmux)

source $ZSH/oh-my-zsh.sh
export PATH=$PATH:/usr/local/sbin:./node_modules/.bin:/usr/local/bin:~/bin

# Load custom scripts
for file in ~/dotfiles/src/*; do
  source "$file"
done

# }}}
# Vim Mode {{{

bindkey -v
export KEYTIMEOUT=1
# Use vim cli mode
bindkey '^P' up-history
bindkey '^N' down-history

# backspace and ^h working even after
# returning from command mode
bindkey '^?' backward-delete-char
bindkey '^h' backward-delete-char

# ctrl-w removed word backwards
bindkey '^w' backward-kill-word

# ctrl-r starts searching history backward
bindkey '^r' history-incremental-search-backward

# }}}
# System settings {{{

ulimit -n 1000
unsetopt histverify

# }}}
