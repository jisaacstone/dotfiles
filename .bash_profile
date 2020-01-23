set -o vi

alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
alias .....="cd ../../../.."
alias grep="grep --color"

export EDITOR=vim

bind '"\e[A"':history-search-backward
bind '"\e[B"':history-search-forward

complete -C /Users/isaas/homebrew/bin/aws_completer aws

function unset_aws {
  unset $(env | grep AWS | grep -v URI | cut -d'=' -f1)
}
function gt_branch {
  ref=$(git symbolic-ref HEAD 2> /dev/null) || return
  echo ${ref#refs/heads/}
}
function gt_project {
  prj=$(git remote -v 2>/dev/null | grep origin | head -1 2> /dev/null) || return
  pj=$(echo ${prj##*/} | cut -d. -f1)  
  echo ${pj}
}

function __prompt_command {
    local Ext="$?"             # This needs to be first
    PS1=""

    local RCol='\[\e[0m\]'

    local Red='\[\e[0;31m\]'
    local Gre='\[\e[0;32m\]'
    local Yel='\[\e[0;33m\]'
    local Wht='\[\e[0;37m\]'
    local Pth=$(echo $PWD | sed "s/\(.\)[^\/]*\//\1\//g")
    PS1+=" ${Gre}\h${Pth} ${Yel}($(gt_project):$(gt_branch))
"
    if [ $Ext != 0 ]
    then
        PS1+="${Red}\$${RCol} "
    else
        PS1+="${Wht}\$${RCol} "
    fi
}

PROMPT_COMMAND=__prompt_command

export PATH=$(pyenv root)/shims:$(pyenv root)/versions/$(pyenv version-name)/bin:$PATH
