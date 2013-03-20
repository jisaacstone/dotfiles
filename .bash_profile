# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

# User specific aliases and functions
alias ll="ls -lA --color=always"
alias ls="ls --color=always"
alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
alias .....="cd ../../../.."
alias l.="ls -d .*"
alias lld="ls -lUd */"
alias grep="grep --color"
alias ack="ack-grep"
alias please="sudo"

export PYTHONPATH=/pluto:/pluto/pycloud
export EDITOR=vi
export WORKON_HOME=/.virtualenvs
export PROJECT_HOME=$HOME/dev
source /usr/bin/virtualenvwrapper.sh
bind '"\e[A"':history-search-backward
bind '"\e[B"':history-search-forward

function parse_git_branch {
  ref=$(git symbolic-ref HEAD 2> /dev/null) || return
  echo "("${ref#refs/heads/}")"
}

PS1=" \[\e[32m\]\h:\w \[\e[33m\]\$(parse_git_branch)
\[\e[0;37m\]\$\[\e[m\] "

trap 'echo -ne "\e]0;$BASH_COMMAND\007"' DEBUG

source $HOME/solarized/terminal-emulators/sol.dark
source $HOME/.bash_colors

# Source local definitions
if [ -f $HOME/.bash_local ]; then
	$HOME/.bash_local
fi
