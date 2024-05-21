#!/bin/bash

sudo apt -y update
sudo apt -y upgrade
sudo apt -y install xterm rxvt-unicode-256color
sudo apt -y install iotop exiftool

# tools
sudo apt -y install geany vim watchman gdb cloc
sudo apt -y install python3-pip golang
pip3 install virtualenvwrapper --user

sudo add-apt-repository ppa:neovim-ppa/unstable
sudo apt-get update
sudo apt-get install neovim

# development
sudo apt -y install zeal qemu-kvm docker.io inotify-tools jq

# postgresql dev
sudo apt -y install postgresql libpq-dev

sudo apt -y install nginx

# kubectl
sudo apt-get update && sudo apt-get install -y apt-transport-https gnupg2 curl
curl -s https://packages.cloud.google.com/apt/doc/apt-key.gpg | sudo apt-key add -
echo "deb https://apt.kubernetes.io/ kubernetes-xenial main" | sudo tee -a /etc/apt/sources.list.d/kubernetes.list
sudo apt-get update
sudo apt-get install -y kubectl

# laptop
sudo apt -y install tlp tlp-rdw --no-install-recommends

# waits for use on prompt
sudo apt -y install lxde

# ruby
curl -fsSL https://github.com/rbenv/rbenv-installer/raw/master/bin/rbenv-installer | bash

echo '====== run all.sh ======'
