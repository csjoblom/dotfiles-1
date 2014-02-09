alias ls='ls -G'
alias ll='ls -lhA'

alias grep='grep --color=auto'
alias egrep='egrep --color=auto'
alias vim='mvim -v'

alias tmux='tmux -2'

function findrmext {
    find . -name "*.$1" -exec rm -rf {} \;
}

function vboxkext {
    unload() {
        kextstat | grep "org.virtualbox.kext.VBoxUSB" > /dev/null 2>&1 && sudo kextunload -b org.virtualbox.kext.VBoxUSB
        kextstat | grep "org.virtualbox.kext.VBoxNetFlt" > /dev/null 2>&1 && sudo kextunload -b org.virtualbox.kext.VBoxNetFlt
        kextstat | grep "org.virtualbox.kext.VBoxNetAdp" > /dev/null 2>&1 && sudo kextunload -b org.virtualbox.kext.VBoxNetAdp
        kextstat | grep "org.virtualbox.kext.VBoxDrv" > /dev/null 2>&1 && sudo kextunload -b org.virtualbox.kext.VBoxDrv
    }

    load() {
        sudo kextload /Library/Extensions/VBoxDrv.kext -r /Library/Extensions/
        sudo kextload /Library/Extensions/VBoxNetFlt.kext -r /Library/Extensions/
        sudo kextload /Library/Extensions/VBoxNetAdp.kext -r /Library/Extensions/
        sudo kextload /Library/Extensions/VBoxUSB.kext -r /Library/Extensions/
    }

    case "$1" in
        unload|remove)
            unload
            ;;
        load)
            load
            ;;
        *|reload)
            unload
            load
            ;;
    esac
}
