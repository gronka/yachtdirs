#!/bin/bash
#yachtdirs
DOTFILEDIR=$(pwd)
ostype=$(uname)
echo $DOTFILEDIR
echo $HOME
echo $ostype

ln -sf $DOTFILEDIR/.config/nvim $HOME/.config/nvim


## VIMRC
# mkdir -p $HOME/.config/nvim
# ln -sfT $DOTFILEDIR/.config/nvim/coc-settings.json $HOME/.config/nvim/coc-settings.json
# mkdir -p $HOME/.config/nvim/after/plugin
# ln -sfT $DOTFILEDIR/.config/nvim/after/plugin/lsp.lua $HOME/.config/nvim/after/plugin/lsp.lua

# if [ ! -f $HOME/.vim/bundle/Vundle.vim ]; then
# 	echo cloning vundle for vim
# 	git clone https://github.com/VundleVim/Vundle.vim.git $HOME/.vim/bundle/Vundle.vim
# 	echo run :PluginInstall in vim to complete setup
# else
# 	echo vundle already installed... skipping
# fi
# echo Unpacking done!
# echo linking vimrc and co
# ln -sf $DOTFILEDIR/.vimrc $HOME/.vimrc
# ln -sf $DOTFILEDIR/.vimrc $HOME/.config/nvim/init.vim

# echo ++++++++++++++++++++
# echo to finish vim setup run: 
# echo :PluginInstall
# echo :CocInstall coc-flutter
# echo :CocInstall coc-go
# echo :CocInstall coc-prettier
# echo :CocInstall coc-pyright
# echo :CocInstall coc-tsserver
# echo :CocInstall coc-yaml

# echo ++++++++++++++++++++
# echo :TSInstall vim python dart go typescript
# echo install lua-language-server
# echo install pylyzer
# echo cargo install tree-sitter-cli
