# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="agnoster_custom"
DEFAULT_USER="dbl"

# Example aliases
# alias zshconfig="mate ~/.zshrc"
#
#
#set title
#case $TERM in
#    *xterm*)
#     precmd () {print -Pn "\e]0;%n@%m: %~\a"}
#     ;;
#esac


# virtualenvwrapper
export WORKON_HOME=~/.virtualenvs
source /usr/local/share/python/virtualenvwrapper.sh

# source some aliases
source ~/.zsh/aliases.sh

# alias ohmyzsh="mate ~/.oh-my-zsh"

# Set to this to use case-sensitive completion
# CASE_SENSITIVE="true"

# Comment this out to disable bi-weekly auto-update checks
DISABLE_AUTO_UPDATE="true"

# Uncomment to change how many often would you like to wait before auto-updates occur? (in days)
# export UPDATE_ZSH_DAYS=13

# Uncomment following line if you want to disable colors in ls
# DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment following line if you want red dots to be displayed while waiting for completion
COMPLETION_WAITING_DOTS="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(git virtualenv django python)

source $ZSH/oh-my-zsh.sh

# Customize to your needs...
export PATH=/usr/local/bin:/usr/bin:/bin:/usr/local/sbin:/usr/sbin:/sbin:/opt/X11/bin:/usr/local/share/python:/usr/texbin:/usr/local/share/npm/bin/
export PYTHONPATH=/usr/local/lib/python2.7/site-packages

# some other variables
export GIT_EDITOR='vim'
