hostname=$(hostname)
ostype=$(uname)
if [ $ostype == "Cygwin" ]; then
	set meta-flag on
	set convert-meta off
	set output-meta on

	myyoutube() {
		youtube-dl $1 -o '~/Downloads/yt/%(uploader)s %(title)s-%(id)s.%(ext)s' --write-thumbnail
	}

	exit 1;
fi

if [ $ostype == "Darwin" ]; then
	if [ -f /opt/Homebrew/bin/brew ]; then
		eval "$(/opt/Homebrew/bin/brew shellenv)"
	elif [ -f /usr/local/Homebrew/bin/brew ]; then
		eval "$(/usr/local/Homebrew/bin/brew shellenv)"
	fi
fi

# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# If not running interactively, don't do anything
case $- in
    *i*) ;;
    *) return;;
esac

# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# If set, the pattern "**" used in a pathname expansion context will
# match all files and zero or more directories and subdirectories.
#shopt -s globstar

# make less more friendly for non-text input files, see lesspipe(1)
#[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# colored GCC warnings and errors
#export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'

# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if ! shopt -oq posix; then
    if [ -f /usr/share/bash-completion/bash_completion ]; then
        . /usr/share/bash-completion/bash_completion
    elif [ -f /etc/bash_completion ]; then
        . /etc/bash_completion
    fi
fi

parse_git_branch() {
	git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}

# set to 16 colors if in tty
TTY=$(tty)
if [[ $TTY == "/dev/tty"* ]]; then
	export TERM=linux16-color
fi

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color|*-256color) color_prompt=yes;;
esac

# If this is an xterm set the title to user@host:dir
case "$TERM" in
    xterm*|rxvt*)
        PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
        ;;
    *)
        ;;
esac

if [ $hostname == "voidx17" ] || \
	 [ $hostname == "voidx13" ] || \
	 [ $hostname == "void-z13" ] || \
	 [ $ostype == "Darwin" ]; then
	export PS1="\u@\h \[\033[32m\]\w\[\033[33m\]\$(parse_git_branch)\[\033[00m\] $ "
else
	export PS1="\[\033[31m\] \u@\h \[\033[m\] \[\033[32m\]\w\[\033[33m\]\$(parse_git_branch)\[\033[00m\] $ "
fi

if [ "$PS1" ]; then
	complete -cf sudo
fi

#source /etc/profile.d/bash-completion.sh

# we have to call this twtice lol
export TETHYS_HOME=$HOME/.tethys/ers
source $TETHYS_HOME/tethys-activate.sh

if grep -qE "(Microsoft|WSL)" /proc/version &> /dev/null; then
	export DISPLAY=:0.0
fi

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/home/parallels/miniforge3/bin/conda' 'shell.bash' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/home/parallels/miniforge3/etc/profile.d/conda.sh" ]; then
        . "/home/parallels/miniforge3/etc/profile.d/conda.sh"
    else
        export PATH="/home/parallels/miniforge3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

source ~/.profile_common
