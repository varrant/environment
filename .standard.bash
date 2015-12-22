#!/bin/bash

# Determine OS
uname=`uname -s`
platform="unknown"
if [ "$(uname)" == "Darwin" ]; then
    platform="OSX"
elif [ "$(uname)" == "Linux" ]; then
    platform="Linux"
fi

# Bash prompt
if [ "$platform" == "OSX" ]; then
    if [ -f $(brew --prefix)/etc/bash_completion ]; then
        . $(brew --prefix)/etc/bash_completion
        export GIT_PS1_SHOWDIRTYSTATE=1
        export PS1='\[\033[01;32m\]\u@\h \[\033[01;34m\]\w \[\033[01;33m\]$(__git_ps1) \[\033[01;34m\]> \[\033[00m\]'
    else
        echo "Warn: bash_completion not found"
        export PS1='\[\033[01;32m\]\u@\h \[\033[01;34m\]\w \[\033[01;34m\]> \[\033[00m\]'
    fi
elif [ "$platform" == "Linux" ]; then
    if [ -f /etc/bash_completion ]; then
        . /etc/bash_completion
       export GIT_PS1_SHOWDIRTYSTATE=1
        export PS1='\[\033[01;32m\]\u@\h \[\033[01;34m\]\w \[\033[01;33m\]$(__git_ps1) \[\033[01;34m\]> \[\033[00m\]'
    else
        echo "Warn: bash_completion not found"
        export PS1='\[\033[01;32m\]\u@\h \[\033[01;34m\]\w \[\033[01;34m\]> \[\033[00m\]'
    fi
fi

# Git autocomplete
if [ -f ~/.git-completion.bash ]; then
    . ~/.git-completion.bash
fi

# Highlighting
export GREP_OPTIONS='--color=auto'
if [ "$platform" == "OSX" ]; then
    export LSCOLORS="Exfxcxdxbxegedabagacad"
    alias ls="ls -G"
elif [ "$platform" == "Linux" ]; then
    export LS_COLORS="Exfxcxdxbxegedabagacad"
    alias ls="ls --color=auto"
else
    echo "Warn: unknown platform - not setting alias for ls"
fi

# Navigation
alias ..='cd ..'

# Add current directory to PATH
export PATH=$PATH:.

