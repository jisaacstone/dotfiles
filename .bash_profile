# User specific aliases and functions
set -o vi

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
alias rapdir="*/src/main/java/com/ebay/app/raptor"

export EDITOR=vim

# bind up and down arrows to history search
bind '"\e[A"':history-search-backward
bind '"\e[B"':history-search-forward

function gt_branch {
  ref=$(git symbolic-ref HEAD 2> /dev/null) || return
  echo ${ref#refs/heads/}
}
function gt_project {
  prj=$(git remote -v | grep origin | head -1 2> /dev/null) || return
  pj=$(echo ${prj##*/} | cut -d. -f1)
  echo ${pj}
}
function compareurl {
    echo "https://github.scm.corp.ebay.com/jistone/$(gt_project)/compare/LOKI:master...$(gt_branch)"
}
function location {
    echo $(echo $PWD | sed "s/\(.\)[^\/]*\//\1\//g")
}

PS1=" \[\e[32m\]\h:\$(location) \[\e[33m\](\$(gt_project):\$(gt_branch))
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
export ORACLE_HOME=/usr/lib/oracle/11.2/client64/
alias tomdeploy="cp */target/ROOT.war ~/ride-5.0.0-linux64/apache-tomcat-7.0.47/webapps/ && rm -r ~/ride-5.0.0-linux64/apache-tomcat-7.0.47/webapps/ROOT && ~/ride-5.0.0-linux64/apache-tomcat-7.0.47/bin/startup.sh && tail -f ~/ride-5.0.0-linux64/apache-tomcat-7.0.47/logs/catalina.out | grcat log"
alias tomtail="tail -f ~/ride-5.0.0-linux64/apache-tomcat-7.0.47/logs/catalina.out | grcat log"
alias tomstop=~/ride-5.0.0-linux64/apache-tomcat-7.0.47/bin/shutdown.sh 
