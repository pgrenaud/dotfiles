#
# Bash settings
#

# If not running interactively, don't do anything
[ -z "$PS1" ] && return

# Check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# Append to the history file, don't overwrite it
shopt -s histappend

# Don't put duplicate lines in the history. See bash(1) for more options
#export HISTCONTROL=ignoredups
export HISTCONTROL=ignoreboth

# The maximum number of lines contained in the history file.
export HISTFILESIZE=100000

# The number of commands to remember in the command history.
export HISTSIZE=50000

#
# Path definitions
#

# GNU tools by default
export PATH="/usr/local/opt/coreutils/libexec/gnubin:$PATH"
export MANPATH="/usr/local/opt/coreutils/libexec/gnuman:$MANPATH"

# Android SDK
export ANDROID_HOME=/usr/local/opt/android-sdk

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/bin" ] ; then
    export PATH="$HOME/bin:$PATH"
fi

# Autojump
if [ -s /usr/local/etc/profile.d/autojump.sh ]; then
    . /usr/local/etc/profile.d/autojump.sh
fi

#
# Prompt definitions
#

# Prompt
export PS1='\[\e[01;32m\]\u\[\e[01;33m\]@\[\e[01;34m\]\h\[\e[01;37m\]:\[\e[01;36m\]\w\[\e[01;37m\]\$\[\e[00m\] '

#
# Colors definitions
#

# Enable color support of ls, *dir and *grep
if [ "$TERM" != "dumb" ]; then
    eval "`dircolors -b`"
    alias ls='ls --color=auto --quoting-style=literal'
    alias dir='dir --color=auto'
    alias vdir='vdir --color=auto'
    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'

    # Custom color for ls
    export LS_COLORS="*.dmg=01;31:$LS_COLORS"
fi

#
# Aliases definitions
#

# Speed aliases
alias la='ls -a'
alias ll='ls -lh'
alias ld='ls -lhrt'
alias lla='ls -lha'
alias lda='ls -lhrta'
alias cdd='cd ..'
alias suu='su -'
#alias vi='vim'
#alias diff='colordiff'
alias wgetncc='wget --no-check-certificate'
alias here='open .'

# Subversion
svndiff()
{
    svn diff "${@}" | colordiff
}


#
# Completion execution
#

# Enable programmable completion features
if [ -f /usr/local/etc/bash_completion ]; then
    . /usr/local/etc/bash_completion
fi
