# force ubuntu16 to use ipv4 for apt, since ipv6 doesn't work lol
# echo 'Acquire::ForceIPv4 "true";' > /etc/apt/apt.conf.d/99force-ipv4

apt update
# for adding other repos
sudo apt install apt-transport-https ca-certificates curl software-properties-common

apt install openbox obconf xfce4 lxde lxpanel lxterminal unrar xclip
apt install libreoffice ffmpeg
apt install chromium-browser
#snap install node --classic --channel=11

apt install rxvt-unicode-256color

sudo apt-get install python-dev python-pip python3-dev python3-pip python3-neovim python-neovim
sudo apt install libpq-dev  # for psycopg2

#add-apt-repository ppa:neovim-ppa/unstable
#apt update
#apt install neovim
#sudo update-alternatives --install /usr/bin/vi vi /usr/bin/nvim 60
#sudo update-alternatives --config vi
#sudo update-alternatives --install /usr/bin/vim vim /usr/bin/nvim 60
#sudo update-alternatives --config vim
#sudo update-alternatives --install /usr/bin/editor editor /usr/bin/nvim 60
#sudo update-alternatives --config editor


#echo "deb http://www.apache.org/dist/cassandra/debian 311x main" | sudo tee -a /etc/apt/sources.list.d/cassandra.sources.list
#curl https://www.apache.org/dist/cassandra/KEYS | sudo apt-key add -
#apt update
#apt install cassandra

#add-apt-repository ppa:gophers/archive
#apt update
#apt install golang-1.10-go

#curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | sudo apt-key add -
#echo "deb https://dl.yarnpkg.com/debian/ stable main" | sudo tee /etc/apt/sources.list.d/yarn.list
#sudo apt-get update && sudo apt-get install yarn

# rootless podman
sysctl -w "net.ipv4.ping_group_range=0 2000000"
echo might need to install rootless? idk

apt install vlc smplayer

# apt install snapd for package management
echo add export PATH=/usr/lib/go-1.10/bin:$PATH to .profile_local
echo or install golang with snap install go --classic --channel=11
echo add mem_sleep_default=deep to GRUB_CMDLINE_LINUX_DEFAULT in /etc/default/grub


sudo apt install virtualenvwrapper

exit

### THIS SEEMS TO FAIL ###
# fix for docker and vpn clash 
#ip link del docker0
#ip link add docker0 type bridge
#ip addr add dev docker0 172.17.43.1/16
#ip link set docker0 up
# where 172.17.43.1/16 is the same bridge IP as coreos
### THIS SEEMS TO WORK ###
# add the following to /etc/docker/daemon.json
#{
# "bip": "192.168.1.5/24",
# "fixed-cidr": "192.168.1.5/25"
#}

echo Install nvm from https://github.com/nvm-sh/nvm
echo then run nvm install node to install latest
