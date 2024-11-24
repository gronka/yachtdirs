#!/bin/bash

# install xcode from app store and CLI tools at the same time
# xcode-select --install

# tell xcode to use CLI tools
sudo xcode-select --switch /Applications/Xcode.app/Contents/Developer
sudo xcodebuild -runFirstLaunch
# agree to license
sudo xcodebuild -license

# from google: brave, discord, firefox, telegram
# from appstore: 

# install homebrew
brew install git node bash
# unpack this repo ./unpack.sh
# vim -> PluginInstall
sudo softwareupdate --install-rosetta --agree-to-license

# for flutter
sudo gem install cocoapods
sudo gem uninstall ffi && sudo gem install ffi -- --enable-libffi-alloc


brew install python
brew install neovim vim coreutils deno
brew install cocoapods virtualenvwrapper postgresql

brew install alacritty
brew install --cask font-bitstream-vera-sans-mono-nerd-font

# npm config set prefix '~/.npm-global'

# npm install -g npm yarn

# fix yarn
# cd ~/.vim/bundle/coc.nvim
# yarn install

# minikube
brew install minikube dockman

# rust
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh

echo 'READ THIS DOCUMENT FOR ADDITIONAL STEPS'
# install karabiner to remap keys
# to change default shell, open users & groups and CONTROL CLICK on your
# icon to open advanced settings
# change it to /opt/homebrew/bin/bash

# to enable ctrl forward and back, open keyboard > Shortcuts > mission control
# then ensure that move left a space and move right a space are unbound from
# ctrl + direction
# then create the file .inputrc with the text
#"\e[1;5D": backward-word
#"\e[1;5C": forward-word

# disable autoformatting
# prefs > keyboard > Text > uncheck the boxes, including smart quotes
