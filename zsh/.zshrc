# ZSH Setup
ZSH=$HOME/.oh-my-zsh
ZSH_THEME="adrian"

# Aliases
alias composer='php composer.phar'
alias copy='xclip -selection clipboard'
alias paste='xclip -selection clipboard -o'
alias cq='clear; qissues'
alias vimt="vim '+TddTarget test:1.0'"
alias bp='paplay /usr/share/sounds/KDE-Im-Message-In.ogg'
alias ll='ls -al'
alias qi='qissues'

# Rename the terminal's title
rename() {
    echo -ne "\033]0;$1\007";
}

# ZSH Config
DISABLE_AUTO_UPDATE="true"
DISABLE_AUTO_TITLE="true"
plugins=(git git-extras history node npm symfony2 tmux)

source $ZSH/oh-my-zsh.sh
export PATH=$PATH:./node_modules/.bin:/home/adrian/bin:/usr/lib/lightdm/lightdm:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games
