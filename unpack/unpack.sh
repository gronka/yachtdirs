#!/bin/bash
#yachtdirs
DOTFILEDIR=$(pwd)
ostype=$(uname)
echo $DOTFILEDIR
echo $HOME
echo $ostype


echo setting .gitignore_global
git config --global core.excludesfile ~/.gitignore_global
ln -sf $DOTFILEDIR/.gitignore_global $HOME/.gitignore_global

echo linking bash
ln -sf $DOTFILEDIR/.bash_profile $HOME/.bash_profile
ln -sf $DOTFILEDIR/.bashrc $HOME/.bashrc
ln -sf $DOTFILEDIR/.profile_common $HOME/.profile_common

# mkdir -p $HOME/.config/nvim
# mkdir -p $HOME/.config/nvim/after/plugin
# ln -sfT $DOTFILEDIR/.config/nvim/after/plugin/lsp.lua $HOME/.config/nvim/after/plugin/lsp.lua
ln -sf $DOTFILEDIR/.config/nvim $HOME/.config/nvim

if [[ $ostype == "Linux" ]] || [[ $ostype == *"CYGWIN"* ]]; then
	echo Linux detected!
	echo linking .xinitrc and .Xdefaults
	ln -sf $DOTFILEDIR/.xinitrc $HOME/.xinitrc
	ln -sf $DOTFILEDIR/.Xdefaults $HOME/.Xdefaults
	ln -sf $DOTFILEDIR/.Xmodmap $HOME/.Xmodmap

	echo linking configs and launchers for xfce and openbox
	ln -sfT $DOTFILEDIR/.config/autostart $HOME/.config/autostart
	ln -sfT $DOTFILEDIR/.config/lxpanel $HOME/.config/lxpanel
	ln -sfT $DOTFILEDIR/.config/lxterminal $HOME/.config/lxterminal
	ln -sfT $DOTFILEDIR/.config/fontconfig $HOME/.config/fontconfig

	echo installing powerline-fonts
	git clone https://github.com/powerline/fonts.git --depth=1 /tmp/fonts
	/tmp/fonts/install.sh
	fc-cache -vf

	#ln -sfT $DOTFILEDIR/.config/openbox $HOME/.config/openbox
	mkdir -p $HOME/.config/openbox
	ln -sfT $DOTFILEDIR/.config/openbox/autostart $HOME/.config/openbox/autostart
	ln -sfT $DOTFILEDIR/.config/openbox/menu.xml $HOME/.config/openbox/menu.xml
	ln -sfT $DOTFILEDIR/.config/openbox/Release.key $HOME/.config/openbox/Release.key
	if [ $hostname == "mack" ] || \
		 [ $hostname == "asahi" ]; then
		ln -sfT $DOTFILEDIR/.config/openbox/rc-asahi.xml $HOME/.config/openbox/rc.xml
	else
		ln -sfT $DOTFILEDIR/.config/openbox/rc.xml $HOME/.config/openbox/rc.xml
	fi

elif [[ $ostype == "Darwin" ]]; then
	echo MacOS detected! nothing special to do..
fi


#echo linking server files
#ln -sf $DOTFILEDIR/cassarun $HOME/cassarun
#ln -sf $DOTFILEDIR/killcassa $HOME/killcassa
#ln -sf $DOTFILEDIR/uwsgirun $HOME/uwsgirun
#ln -sf $DOTFILEDIR/gruntrun $HOME/gruntrun


if [ ! -f $HOME/.vim/bundle/Vundle.vim ]; then
	echo cloning vundle for vim
	git clone https://github.com/VundleVim/Vundle.vim.git $HOME/.vim/bundle/Vundle.vim
	echo run :PluginInstall in vim to complete setup
else
	echo vundle already installed... skipping
fi
echo Unpacking done!
echo linking vimrc and co
ln -sf $DOTFILEDIR/.vimrc $HOME/.vimrc
ln -sf $DOTFILEDIR/.vimrc $HOME/.config/nvim/init.vim
ln -sf $DOTFILEDIR/.tmux.conf $HOME/.tmux.conf


echo ++++++++++++++++++++
echo you might need to define export WIFI=wlpxxs0 in .profile_local

echo ++++++++++++++++++++
echo :TSInstall vim python dart go typescript
echo install lua-language-server
echo install pylyzer
echo cargo install tree-sitter-cli
