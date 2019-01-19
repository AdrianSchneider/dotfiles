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

function tmux_whereami() {
  tmux_session_info $(tmux display-message -p '#S')
}

function tmux_session_info() {
  local session="$1"
  echo "$session $(tmux_session_root "$session" | xargs basename) ($(tmux_branch_from_session $session))";
}

function tmux_sessions_with_branches() {
  tmux list-sessions \
    | sed -E 's/:.*$//' \
    | while read session; do tmux_session_info "$session"; done \
    | column -t
}

function tmux_session_root() {
  local session="$1"
  (
    cd $(tmux display-message -p -t "$session:1.0" -F '#{pane_current_path}')
    git rev-parse --show-toplevel 2> /dev/null || pwd
  )
}

function tmux_branch_from_session() {
  local session="$1"
  (
    cd $(tmux display-message -p -t "$session:1.0" -F '#{pane_current_path}')
    git rev-parse --abbrev-ref HEAD
  )
}
