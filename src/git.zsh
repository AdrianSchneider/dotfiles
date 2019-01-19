unalias gcl 2> /dev/null
unalias gco 2> /dev/null
unalias gpu 2> /dev/null

# Create new repository
alias ginit='git init; git commit --allow-empty -m "initial commit";'

# Pushes this up to origin, and sets the local branch tracking
# Then creates a pull request against this branch's upstream branch (parent branch)
function pr() {
    local branch=$(git rev-parse --abbrev-ref HEAD)
    local upstream="${1:-`git_upstream_branch`}"
    git push origin "$branch"
    git branch -u "origin/$branch" 1>/dev/null
    hub pull-request -b "$upstream"
}

# show recent branches
function git_recent_branches() {
    git branch -vvv --color=always --sort=committerdate | tail -r
}

# Interactively pick a branch (for scripting)
function select_branch() {
    git_recent_branches | tr -d '*' | selecta | perl -pe 's/\e\[?.*?[\@-~]//g' | awk '{print $1}' 
}

# Interactively checkout a branch
function gco() {
    git checkout $(select_branch)
}

# Interactively checkout a latest branch
function gcl() {
    git checkout $(git latest | selecta)
}

# Interactively delete a branch
function gdb() {
    git branch -D $(git bs --color=always | selecta)
}

# Git diff against upstream branch
# optionally pass in -w to ignore all whitespace differences
function gdu() {
    local branch=$(git_upstream_branch)
    if [ "$1" = "-w" ]; then
        git diff -w --ignore-blank-lines "$branch" --
    else
        git diff "$branch"
    fi
}

# pushes the current branch up, and sets up tracking
function gpu() {
    git push -u origin $(git rev-parse --abbrev-ref HEAD)
}

# Delete branch interactively
function gdb() {
    git branch -D $(git branch | selecta)
}

# Interactively delete branches until exit
function gdbs() {
    while true; do
        gdb
    done
}
