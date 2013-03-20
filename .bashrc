# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

# User specific aliases and functions
alias ll="ls -lhA --color=always"
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

export EDITOR=vi
export PYTHONPATH=/pluto:/pluto/pycloud
export MILO_CONFIG=MiloCrawlConfig/milo/crawl/config/test.ini
export MILODB_URL=postgresql://milo:@milodb/milodb

export WORKON_HOME=$HOME/.virtualenvs
export PROJECT_HOME=$HOME/dev
source /usr/local/bin/virtualenvwrapper.sh
bind '"\e[A"':history-search-backward
bind '"\e[B"':history-search-forward

function parse_git_branch {
  ref=$(git symbolic-ref HEAD 2> /dev/null) || return
  echo "("${ref#refs/heads/}")"
}

PS1=" \[\e[32m\]\h:\w \[\e[33m\]\$(parse_git_branch)
\[\e[0;37m\]\$\[\e[m\] "

trap 'echo -ne "\e]0;$BASH_COMMAND\007"' DEBUG
