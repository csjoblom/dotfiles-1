alias ls='ls -G'
alias ll='ls -lhA'

alias grep='grep --color=auto'
alias egrep='egrep --color=auto'

alias tmux='tmux -2'
#alias pg_start='pg_ctl -D /usr/local/var/postgres -l /usr/local/var/postgres/server.log start'
#alias pg_stop='pg_ctl -D /usr/local/var/postgres stop -s -m fast'


# work (blueprint) aliases:
export BLUEPRINT_HOME="$HOME/Workspace/bph_api/"
alias pg_start="pg_ctl -D /usr/local/var/postgres -l /usr/local/var/postgres/server.log start"
alias pg_stop="pg_ctl -D /usr/local/var/postgres stop"
alias pg_status="pg_ctl -D /usr/local/var/postgres status"

function start_blueprint() {
    workon blueprint
    cd $BLUEPRINT_HOME

    # aliases:
    alias br='./manage.py build_responses'
    alias manage="./manage.py"
    alias nuke="./manage.py nuke"
    alias sm="./manage.py schemamigration --auto api"
    alias mm="./manage.py migrate api --merge"
    alias rms="rm -rf bph/static"
    alias tf="./manage.py test front"
    alias ta="./manage.py test api"


    pg_status
    [[ 3 == $? ]] && pg_start
    return 0
}

alias bp="start_blueprint"

