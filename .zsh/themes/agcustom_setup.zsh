# vim:ft=zsh ts=2 sw=2 sts=2
#
# agnoster's Theme - https://gist.github.com/3712874
# A Powerline-inspired theme for ZSH
#
# # README
#
# In order for this theme to render correctly, you will need a
# [Powerline-patched font](https://gist.github.com/1595572).
#
# In addition, I recommend the
# [Solarized theme](https://github.com/altercation/solarized/) and, if you're
# using it on Mac OS X, [iTerm 2](http://www.iterm2.com/) over Terminal.app -
# it has significantly better color fidelity.
#
# # Goals
#
# The aim of this theme is to only show you *relevant* information. Like most
# prompts, it will only show git information when in a git working directory.
# However, it goes a step further: everything from the current user and
# hostname to whether the last call exited with an error to whether background
# jobs are running in this shell will all be displayed automatically when
# appropriate.

### Segment drawing
# A few utility functions to make it easy and re-usable to draw segmented prompts


# Begin a segment
# Takes two arguments, background and foreground. Both can be omitted,
# rendering default background/foreground.

pmodload 'helper'

function prompt_agcustom_precmd {
	CURRENT_BG='NONE'
	SEGMENT_SEPARATOR=''
	SEGMENT_SEPARATOR_ALT=''

  if (( $+functions[git-info] )); then
    git-info
  fi
	if (( $+functions[python-info ])); then
		python-info
	fi

	function p_segment() {
		local bg fg
		[[ -n $1 ]] && bg="%K{$1}" || bg="%k"
		[[ -n $2 ]] && fg="%F{$2}" || fg="%f"
		if [[ $CURRENT_BG != 'NONE' && $1 != $CURRENT_BG ]]; then
			echo -n " %{$bg%F{$CURRENT_BG}%}$SEGMENT_SEPARATOR%{$fg%} "
		else
			echo -n "%{$bg%}%{$fg%} "
		fi
		CURRENT_BG=$1
		[[ -n $3 ]] && echo -n $3
	}

	# End the prompt, closing any open segments
	function p_end() {
		if [[ -n $CURRENT_BG ]]; then
			echo -n " %{%k%F{$CURRENT_BG}%}$SEGMENT_SEPARATOR"
		else
			echo -n "%{%k%}"
		fi
		echo -n "%{%f%}"
		CURRENT_BG=''
	}

	### Prompt components
	# Each component will draw itself, and hide itself if no information needs to be shown

	# Context: user@hostname (who am I and where am I)
	function p_context() {
		local user=`whoami`

		if [[ "$user" != "$DEFAULT_USER" || -n "$SSH_CLIENT" ]]; then
			p_segment black default "%(!.%{%F{yellow}%}.)$user@%m"
		fi
	}

	# Git: branch/detached head, dirty status
	function p_git() {
		local ref dirty
		if $(git rev-parse --is-inside-work-tree >/dev/null 2>&1); then
			dirty=$(parse_git_dirty)
			ref=$(git symbolic-ref HEAD 2> /dev/null) || ref="➦ $(git show-ref --head -s --abbrev |head -n1 2> /dev/null)"
			if [[ -n $dirty ]]; then
				p_segment yellow black
			else
				p_segment green black
			fi

			setopt promptsubst
			autoload -Uz vcs_info

			zstyle ':vcs_info:*' enable git
			zstyle ':vcs_info:*' get-revision true
			zstyle ':vcs_info:*' check-for-changes true
			zstyle ':vcs_info:*' stagedstr '✚'
			zstyle ':vcs_info:git:*' unstagedstr '●'
			zstyle ':vcs_info:*' formats ' %u%c'
			zstyle ':vcs_info:*' actionformats '%u%c'
			vcs_info
			echo -n "${ref/refs\/heads\// }${vcs_info_msg_0_}"
		fi
	}

	# Dir: current working directory
	function p_dir() {
		p_segment blue black '%~'
	}

	# Virtualenv: current working virtualenv
	function p_virtualenv() {
		local virtualenv_path="$python_info[virtualenv]"
		if [[ -n $virtualenv_path ]]; then
			p_segment blue black "$SEGMENT_SEPARATOR_ALT `basename $virtualenv_path`"
		fi
	}

	# Status:
	# - was there an error
	# - am I root
	# - are there background jobs?
	function p_status() {
		local symbols
		symbols=()
		[[ $RETVAL -ne 0 ]] && symbols+="%{%F{red}%}✘"
		[[ $UID -eq 0 ]] && symbols+="%{%F{yellow}%}⚡"
		[[ $(jobs -l | wc -l) -gt 0 ]] && symbols+="%{%F{cyan}%}⚙"

		[[ -n "$symbols" ]] && p_segment black default "$symbols"
	}

	function build_prompt() {
		RETVAL=$?
		p_status
		p_context
		p_dir
		p_virtualenv
		p_git
		p_end
	}
}

# prezto stuff
function prompt_agcustom_setup {
  autoload -Uz add-zsh-hook
  add-zsh-hook precmd prompt_agcustom_precmd

	zstyle ':prezto:module:python:info:virtualenv' format 'virtualenv:%v'

	PROMPT="%{%f%b%k%}$(build_prompt) "
	RPROMPT=''
}
