alias ll='ls -alF'
alias sf='app/console'
alias composer='php composer.phar'


function _git_prompt() {
    local git_status="`git status -unormal 2>&1`"
    if ! [[ "$git_status" =~ Not\ a\ git\ repo ]]; then
        if [[ "$git_status" =~ nothing\ to\ commit ]]; then
            local ansi=42
        elif [[ "$git_status" =~ nothing\ added\ to\ commit\ but\ untracked\ files\ present ]]; then
            local ansi=43
        else
            local ansi=45
        fi
        if [[ "$git_status" =~ On\ branch\ ([^[:space:]]+) ]]; then
            branch=${BASH_REMATCH[1]}
            test "$branch" != master || branch=' '
        else
            # Detached HEAD.  (branch=HEAD is a faster alternative.)
            branch="(`git describe --all --contains --abbrev=4 HEAD 2> /dev/null ||
                echo HEAD`)"
        fi
        echo -n '\[\e[0;37;'"$ansi"';1m\]'"$branch"'\[\e[0m\] '
    fi
}
function _prompt_command() {
    COLOR=$(tput setaf 75)
    NORMAL=$(tput sgr0)
    PS1="`_git_prompt`"'\[\e[0;27m\]\w \$\[\e[0m\] '
    PS1="`_git_prompt`"'\[${COLOR}\]\w \[${NORMAL}\]'
}
PROMPT_COMMAND=_prompt_command

TERM=xterm-256color

if [ -z "$TMUX" ]; then
    # we're not in a tmux session
    
    if [ ! -z "$SSH_TTY" ]; then
        # We logged in via SSH
        
        # if ssh auth variable is missing
        if [ -z "$SSH_AUTH_SOCK" ]; then
            export SSH_AUTH_SOCK="$HOME/.ssh/.auth_socket"
        fi

        # if socket is available create the new auth session
        if [ ! -S "$SSH_AUTH_SOCK" ]; then
            `ssh-agent -a $SSH_AUTH_SOCK` > /dev/null 2>&1
            echo $SSH_AGENT_PID > $HOME/.ssh/.auth_pid
        fi

        # if agent isn't defined, recreate it from pid file
        if [ -z $SSH_AGENT_PID ]; then
            export SSH_AGENT_PID=`cat $HOME/.ssh/.auth_pid`
        fi

        # Add all default keys to ssh auth
        ssh-add 2>/dev/null

        # start tmux
        tmux attach
    fi
fi

unset MAILCHECK
