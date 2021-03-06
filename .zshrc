#
# Executes commands at the start of an interactive session.
#
# Authors:
#   Sorin Ionescu <sorin.ionescu@gmail.com>


DEFAULT_USER="dbl"
BASE16_SCHEME="eighties"
BASE16_SHELL="$HOME/.dotfiles/base16-shell/base16-$BASE16_SCHEME.dark.sh"
[[ -s $BASE16_SHELL ]] && . $BASE16_SHELL


# Source Prezto.
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi

# custom
for f in ~/.zsh/*.sh; do source $f; done
source ~/.zsh/git-omz.zsh
# source ~/.zsh/django.plugin.zsh

bindkey '^R' history-incremental-search-backward

# bind C-x f to filename completion
zle -C complete-file menu-expand-or-complete _generic
zstyle ':completion:complete-file:*' completer _files
bindkey -M viins '^Xf'      complete-file

# fallback to filename completion
zstyle ':completion:*' completer _expand _complete _files \
  _correct _approximate
