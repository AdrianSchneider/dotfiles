# Switches to a tmux pane, or creates it in tmuxp if its not there yet
function attach() {
    tmux attach -t "$1" || tmuxp load "~/.tmuxp/$1.yaml" -y
}

# This was used to export tmux environment vars
function fixssh() {
  for key in SSH_AUTH_SOCK SSH_CONNECTION SSH_CLIENT; do
    if (tmux show-environment | grep "^${key}" > /dev/null); then
      value=`tmux show-environment | grep "^${key}" | sed -e "s/^[A-Z_]*=//"`
      export ${key}="${value}"
    fi
  done
}

# Interactively switch to a session
function goto() {
  if [ -z "$1" ]; then
    local session=$(tmux ls | selecta | cut -d ':' -f 1)
  else
    local session="$1"
  fi
  tmux switch-client -t $session
}
