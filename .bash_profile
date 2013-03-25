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

export EDITOR=vim

# bind up and down arrows to history search
bind '"\e[A"':history-search-backward
bind '"\e[B"':history-search-forward

function parse_git_branch {
  ref=$(git symbolic-ref HEAD 2> /dev/null) || return
  echo "("${ref#refs/heads/}")"
}

PS1=" \[\e[32m\]\h:\w \[\e[33m\]\$(parse_git_branch)
\[\e[0;37m\]\$\[\e[m\] "

trap 'echo -ne "\e]0;$BASH_COMMAND\007"' DEBUG

# Source local definitions
if [ -f /usr/bin/virtualenvwrapper.sh ]; then
    export WORKON_HOME=$HOME/.virtualenvs
    source /usr/bin/virtualenvwrapper.sh
fi
if [ -f $HOME/.bash_colors ]; then
	source $HOME/.bash_colors
fi
if [ -f $HOME/solarized/terminal-emulators/sol.dark ]; then
	source $HOME/solarized/terminal-emulators/sol.dark
fi
if [ -f $HOME/.bash_local ]; then
	source $HOME/.bash_local
fi
