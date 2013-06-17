# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

#ZSH_THEME="agnoster_custom"
DEFAULT_USER="dbl"

# Set to this to use case-sensitive completion
# CASE_SENSITIVE="true"

# Comment this out to disable bi-weekly auto-update checks
DISABLE_AUTO_UPDATE="true"

# Uncomment following line if you want to disable autosetting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment following line if you want red dots to be displayed while waiting for completion
# COMPLETION_WAITING_DOTS="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(git virtualenv virtualenvwrapper django python vi-mode brew fabric osx tmux)

# run oh-my-zsh
source $ZSH/oh-my-zsh.sh

# activate powerline
source ~/.zsh/powerline.zsh

# virtualenvwrapper
# export WORKON_HOME=~/.virtualenvs
# source /usr/local/bin/virtualenvwrapper.sh

# source some aliases
for f in ~/.zsh/*.sh; do source $f; done

export PATH=/usr/local/bin:/usr/bin:/bin:/usr/local/sbin:/usr/sbin:/sbin:/usr/local/share/python:/usr/local/share/npm/bin:/usr/texbin

# make sure pythonpath is empty, python is an adult it can figure it out
# also if its set it fucks up python3
unset PYTHONPATH

# some other variables
export GIT_EDITOR='vim'

# some keys for reverse search
bindkey -M vicmd '?' history-incremental-search-backward
bindkey '^R' history-incremental-pattern-search-backward
