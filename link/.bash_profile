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
HISTCONTROL=ignoreboth

# The maximum number of lines contained in the history file.
HISTFILESIZE=100000

# The number of commands to remember in the command history.
HISTSIZE=50000

#
# Path definitions
#

# Homebrew
if [ -d "/usr/local/Cellar" ] ; then
    export HOMEBREW_PREFIX="/usr/local";
    export HOMEBREW_CELLAR="/usr/local/Cellar";
    export HOMEBREW_REPOSITORY="/usr/local/Homebrew";
    export PATH="/usr/local/bin:/usr/local/sbin${PATH+:$PATH}";
    export MANPATH="/usr/local/share/man${MANPATH+:$MANPATH}:";
    export INFOPATH="/usr/local/share/info:${INFOPATH:-}";
fi
if [ -d "/opt/homebrew/Cellar" ] ; then
    export HOMEBREW_PREFIX="/opt/homebrew";
    export HOMEBREW_CELLAR="/opt/homebrew/Cellar";
    export HOMEBREW_REPOSITORY="/opt/homebrew";
    export PATH="/opt/homebrew/bin:/opt/homebrew/sbin${PATH+:$PATH}";
    export MANPATH="/opt/homebrew/share/man${MANPATH+:$MANPATH}:";
    export INFOPATH="/opt/homebrew/share/info:${INFOPATH:-}";
fi
export HOMEBREW_NO_INSTALLED_DEPENDENTS_CHECK=1

# Android SDK
#export ANDROID_HOME=/usr/local/opt/android-sdk

# GNU tools
if [ -d "/usr/local/opt/coreutils/libexec/gnubin" ] ; then
    export PATH="/usr/local/opt/coreutils/libexec/gnubin:$PATH"
fi
if [ -d "/usr/local/opt/coreutils/libexec/gnuman" ] ; then
    export MANPATH="/usr/local/opt/coreutils/libexec/gnuman:$MANPATH"
fi
if [ -d "/opt/homebrew/opt/coreutils/libexec/gnubin" ] ; then
    export PATH="/opt/homebrew/opt/coreutils/libexec/gnubin:$PATH"
fi
if [ -d "/opt/homebrew/opt/coreutils/libexec/gnuman" ] ; then
    export MANPATH="/opt/homebrew/opt/coreutils/libexec/gnuman:$MANPATH"
fi

# Composer
if [ -d "$HOME/.composer/vendor/bin" ] ; then
    export PATH="$HOME/.composer/vendor/bin:$PATH"
fi

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/.dotfiles/bin" ] ; then
    export PATH="$HOME/.dotfiles/bin:$PATH"
fi
if [ -d "$HOME/.local/bin" ] ; then
    export PATH="$HOME/.local/bin:$PATH"
fi
if [ -d "$HOME/bin" ] ; then
    export PATH="$HOME/bin:$PATH"
fi

# Autojump
if [ -r /usr/local/etc/profile.d/autojump.sh ]; then
    . /usr/local/etc/profile.d/autojump.sh
fi
if [ -r /opt/homebrew/etc/profile.d/autojump.sh ]; then
    . /opt/homebrew/etc/profile.d/autojump.sh
fi

#
# Prompt definitions
#

# Prompt
PS1='\[\e[01;32m\]\u\[\e[01;33m\]@\[\e[01;34m\]\h\[\e[01;37m\]:\[\e[01;36m\]\w\[\e[01;37m\]\$\[\e[00m\] '

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
alias colorless='less -R'
alias wgetncc='wget --no-check-certificate'
alias history-delete-last='history -d $((HISTCMD-1))'
alias here='open .'
alias fat-composer='COMPOSER_MEMORY_LIMIT=-1 composer'
alias awsume='. awsume'
alias totp='read -s SECRET; oathtool --base32 --totp "$SECRET" | tr -d "\n" | pbcopy; unset SECRET'

# Subversion
svndiff()
{
    svn diff "${@}" | colordiff
}

#
# Completion execution
#

# Enable programmable completion features
if [ -r /usr/local/etc/profile.d/bash_completion.sh ]; then
    . /usr/local/etc/profile.d/bash_completion.sh
fi
if [ -r /opt/homebrew/etc/profile.d/bash_completion.sh ]; then
    . /opt/homebrew/etc/profile.d/bash_completion.sh
fi
