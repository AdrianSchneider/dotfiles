# Run a program n times
function run() {
    number=$1
    shift
    for i in `seq $number`; do
      $@
    done
}

# Run a program repeatedly with breaks between
function repeatedly() {
  while true; do clear; $2; sleep $1; done
}

# Runs a command until it dies, good for testing stability
function untildeath() {
  let i=0;
  command="$@"
  while bash -c "$command" && i=$((i+1)) && sleep 1; do :; done;
  echo "Ran $i times before failing"
}

# Runs a command until it dies, good for testing stability
function untillife() {
  let i=0;
  command="$@"
  while bash -c "! $command" && i=$((i+1)) && sleep 1; do :; done;
  echo "Ran $i times before passing"
}

# Check the result of the last program? (legacy stuff... hmm)
function eh() {
    code=$?
    last=$(history | tail -1 | cut -d ";" -f 1 | sed -E "s/^ ([0-9]+)  //g");
    if [ "$code" '==' "0" ]; then
        terminal-notifier -title "Great Success" -message "$last"
    else
        terminal-notifier -title "EPIC FAIL" -message "$last"
    fi
}

function lmk() {
    if $@; then
        notify "$@" "Command Succeeded"
    else
        notify "$@" "Command FAILED"
    fi
}
