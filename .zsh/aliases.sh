alias ls='ls --color'
alias ll='ls -lhA'

alias grep='grep --color=auto'
alias egrep='egrep --color=auto'

alias tmux='tmux -2'

function findrmext {
    find . -name "*.$1" -exec rm -rf {} \;
}
