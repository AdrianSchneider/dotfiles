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

function notify() {
    terminal-notifier -title "$1" -message "$2";
}
