#!/bin/sh
sysmodmap=/etc/X11/xinit/.Xmodmap
if [ -f $sysmodmap ]; then
		xmodmap $sysmodmap
fi

# skip modmap on some vms
mon=$(xrandr | grep " connected " | awk '{ print $1 }')
if [ $mon = "Virtual-1" ]; then
	:
elif [ $mon = "None-1" ]; then
	usermodmap=$HOME/dotfiles/scripts/xmodmap-m1
	if [ -f "$usermodmap" ]; then
			xmodmap "$usermodmap"
	fi
else
	usermodmap=$HOME/dotfiles/scripts/xmodmap

	if [ -f "$usermodmap" ]; then
			xmodmap "$usermodmap"
	fi
fi

kernname=$(uname -r)
if [[ $kernname == *"asahi"* ]]; then
	xmodmap "$HOME/dotfiles/scripts/xmodmap-m1"
fi

userresources=$HOME/.Xresources
sysresources=/etc/X11/xinit/.Xresources
if [ -f $sysresources ]; then
    xrdb -merge $sysresources
fi

if [ -f "$userresources" ]; then
    xrdb -merge "$userresources"
fi

# start some nice programs
if [ -d /etc/X11/xinit/xinitrc.d ] ; then
 for f in /etc/X11/xinit/xinitrc.d/?*.sh ; do
  [ -x "$f" ] && . "$f"
 done
 unset f
fi

#twm &
#xclock -geometry 50x50-1+1 &
#xterm -geometry 80x50+494+51 &
#xterm -geometry 80x20+494-0 &
#exec xterm -geometry 80x66+0+0 -name login

xrdb -merge .Xdefaults
exec openbox-session
#exec startlxde
