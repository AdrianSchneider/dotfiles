# ZSH Setup {{{

ZSH=$HOME/.oh-my-zsh
ZSH_THEME="adrian"

DISABLE_AUTO_UPDATE="true"
DISABLE_AUTO_TITLE="true"
unsetopt histverify


plugins=(git git-extras history node npm symfony2 tmux docker ssh-agent nvm)

export PATH=$PATH:/usr/local/sbin:/usr/local/bin

source $ZSH/oh-my-zsh.sh

# Load custom scripts
for file in ~/dotfiles/src/*; do
  source "$file"
done

# automatically source .envrc files
eval "$(direnv hook zsh)"


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
# Generic Aliases {{{

alias copy='pbcopy'
alias paste='pbpaste'
alias vimt="vim '+TddTarget test:1.0'"
alias bp='say beep'
alias sayy='say $(tmux display-message -p "#S"). '
alias ll='ls -alF'
alias vim='/usr/local/bin/vim';
alias make='nocorrect make'
alias kubectl='nocorrect kubectl'
alias when='nocorrect when'
alias ssh='nocorrect ssh'
alias git='nocorrect git'
alias ccff='make coverage; open coverage/index.html'
alias qrcode='qrencode -o - -t UTF8'

# }}}
# System settings {{{

ulimit -n 1000
unsetopt histverify

# Include ~/bin in path
export PATH=$PATH:~/bin
export EDITOR=/usr/local/bin/vim

# }}}
# Language Runtime Setup {{{

# node.js
export PATH="$PATH:./node_modules/.bin"
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"

# java
export JAVA_HOME=$(/usr/libexec/java_home)

# }}}
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"
