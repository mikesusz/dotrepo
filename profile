# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# If not running interactively, don't do anything
[ -z "$PS1" ] && return

# don't put duplicate lines in the history. See bash(1) for more options
# ... or force ignoredups and ignorespace
HISTCONTROL=ignoredups:ignorespace

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000

# from furbo - http://furbo.org/2014/09/03/the-terminal/
bind '"\e[A":history-search-backward'
bind '"\e[B":history-search-forward'
export EDITOR="vi"
export CLICOLOR=1

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

PS1='\[\033[1;30m\][\[\033[0;35m\]\u\[\033[0;37m\]@\[\033[1;35m\]\h\[\033[1;30m\]]\[\033[1;30m\]:\[\033[01;34m\]\w\[\033[1;30m\]\$\[\033[0;30m\]\[\033[00m\] '
#PS1='\[\033[0;35m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color) color_prompt=yes;;
esac

# uncomment for a colored prompt, if the terminal has the capability; turned
# off by default to not distract the user: the focus in a terminal window
# should be on the output of commands, not on the prompt
force_color_prompt=yes

export CLICOLOR=1
#export LSCOLORS=GxFxCxDxBxegedabagaced

P_DEPTH=4

if [ -f ~/.dotrepo/aliases ]; then
    source  ~/.dotrepo/aliases
fi

if [ -f ~/.dotrepo/functions ]; then
    source  ~/.dotrepo/functions
fi

if [ -f ~/.dotlocal ]; then
    source ~/.dotlocal
fi

if [ -f /etc/bash_completion ] && ! shopt -oq posix; then
    . /etc/bash_completion
    set show-all-if-ambiguous on
fi
