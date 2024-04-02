# /etc/skel/.bash_profile

# This file is sourced by bash for login shells.  The following line
# runs your .bashrc and is recommended by the bash info pages.
[[ -f ~/.bashrc ]] && . ~/.bashrc
[[ -f ~/.profile_common ]] && source ~/.profile_common

##
# Your previous /Users/taylor/.bash_profile file was backed up as /Users/taylor/.bash_profile.macports-saved_2017-04-09_at_22:34:01
##

# MacPorts Installer addition on 2017-04-09_at_22:34:01: adding an appropriate PATH variable for use with MacPorts.
export PATH="/opt/local/bin:/opt/local/sbin:$PATH"
# Finished adapting your PATH environment variable for use with MacPorts.

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*

# MacPorts Installer addition on 2022-08-11_at_17:56:21: adding an appropriate MANPATH variable for use with MacPorts.
export MANPATH="/opt/local/share/man:$MANPATH"
# Finished adapting your MANPATH environment variable for use with MacPorts.

. "$HOME/.cargo/env"
