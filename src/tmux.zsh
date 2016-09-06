function attach() {
    tmux attach -t "$1" || tmuxp load "~/.tmuxp/$1.yaml" -y
}
