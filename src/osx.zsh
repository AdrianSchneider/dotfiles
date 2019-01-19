# notify message with pwd + tmux session in title
notify() {
  terminal-notifier \
    -title "$(tmux_whereami)" \
    -message "$1" \
    -subtitle "$2"
}
