# tees to to a log file
function t() {
  tee -a "/var/log/stream/${1:-l1}"
}

# adds whitespace to all log files (force page break), then truncates
function wipe() {
    local str=""
    local files="$(find /var/log/stream -type f | xargs)"
    for i in {1..100}; do str="\n${str}" done
    echo "$str" | tee -a `echo $files` > /dev/null
    echo ""     | tee    `echo $files` > /dev/null
}
