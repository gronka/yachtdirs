#!/bin/bash

xbps-install -Syu
xbps-install -Syu
xbps-install -Sy xtools
xlocate -S
echo 'to find a library type xlocate {lib}'
# xbps-install -Sy git
# git clone https://github.com/gronka/.dotfiles

xbps-install -Sy openbox obconf chrony slock sysstat
xbps-install -Sy xcompmgr  # should help with screen artifacts?
xbps-install -Sy xorg xterm mesa-demos
xbps-install -Sy socklog-void neofetch

# xclip auto adds copy paste support for neovim
xbps-install -Sy vim neovim rxvt-unicode lxterminal lxpanel geany xclip
xbps-install -Sy watchman cloc bash-completion
xbps-install -Sy xfce4 lxde spacefm faenza-icon-theme
xbps-install -Sy firefox chromium
xbps-install -Sy vscode adb the_silver_searcher jnettop net-tools bind-utils
xbps-install -Sy util-linux progress

xbps-install -Sy viewnior webp-pixbuf-loader
xbps-install -Sy gpick

xbps-install -Sy python3 python3-neovim python3-pip python3-devel go nodejs
xbps-install -Sy gpick winusb
# for scipy
xbps-install -Sy blas-devel lapack-devel gcc-fortran

xbps-install -Sy libvirt kubernetes-helm minikube

xbps-install -Sy binutils make gcc dkms unzip gdb unar
xbps-install -Sy fuse-exfat exfat-utils ntfs-3g linux-firmware
xbps-install -Sy p7zip zip qimgv bsdtar xarchiver  # add to context
xbps-install -Sy bluez blueman jq
# xbps-install -Sy wpa_supplicant wpa_gui
xbps-install -Sy iwd rsync
ln -s /etc/sv/dhcpcd /var/service/

# flutter
xbps-install -Sy android-tools android-udev-rules simple-mtpfs gvfs-mtp
xbps-install -Sy qemu libvirt bridge-utils virt-manager virt-manager-tools
xbps-install -Sy iptables
# fastdriver
xbps-install -Sy clang cmake ninja pkg-config gtk+3-devel libblkid-devel
ln -s /etc/sv/libvirtd /var/service/
ln -s /etc/sv/virtlockd /var/service/
ln -s /etc/sv/virtlogd /var/service/

# macos vms
xbps-install -Sy libusbmuxd usbmuxd avahi socat

xbps-install -Sy postgresql postgresql-contrib postgresql-client 
xbps-install -Sy postgresql-libs-devel

# markdown and mermaid erdiagrams
pip install --user wheel
pip install --user ReText md-mermaid 
pip install --user virtualenvwrapper


# cypress (js)
xbps-install -Sy xorg-server-xvfb libnotify-devel GConf

# little utilities
xbps-install -Sy iotop lsof psmisc inxi

# xbps-install -Sy void-repo-nonfree
# xbps-install -Sy nvidia
# might need to restart before installing bbswitch
# might need to blacklist nouveau (for xps15)
# xbps-install bumblebee primus bbswitch

xbps-install -Sy cups cups-fileters
# linux-firmware seems to break ethernet connection
xbps-install -Sy wget curl alsa-utils 
xbps-install -Sy openvpn inetutils-ifconfig openresolv

# docker
#xbps-install -Sy docker docker-compose

# rkt
xbps-install -Sy minikube kubectl rkt podman buildah
# rkt in user-mode
xbps-install -Sy slirp4netns fuse-overlayfs
# void updates /etcsubuid and /etc/subgid automatically

# needed for discord
xbps-install -Sy libatomic

# xbps-install NetworkManager network-manager-applet gnome-icon-theme inetutils-ifconfig gnome-keyring xfce4-notifyd
# rm -fr /var/service/dhcpcd
# rm -fr /var/service/wpa_supplicant
# ln -s /etc/sv/NetworkManager /var/service
# ln -s /etc/sv/dbus /var/service
# start nm-applet & to start the service

xbps-install -Sy tekaim flameshot scrot

# font packs - helps with japanese
xbps-install -Sy noto-fonts-cjk noto-fonts-emoji noto-fonts-ttf-extra

# entertainment
xbps-install -Sy xboxdrv vlc smplayer intel-video-accel
xbps-install -Sy pavucontrol alsa-plugins-pulseaudio streamlink

# video utilities: vainfo
xbps-install -Sy libva-utils 
xbps-install -Sy libva-vdpau-driver  # maybe for hardware accel on xps9700?

ln -s /etc/sv/bluetoothd /var/service/
ln -s /etc/sv/chronyd /var/service
ln -s /etc/sv/dbus /var/service/
ln -s /etc/sv/dhcpcd /var/service
ln -s /etc/sv/docker /var/service/
ln -s /etc/sv/iwd /var/service
#ln -s /etc/sv/nanologd /var/service/
ln -s /etc/sv/socklog-unix /var/service/
ln -s /etc/sv/tlp /var/service/

# ln -s /etc/sv/wpa_supplicant /var/service

curl -fsSL https://github.com/rbenv/rbenv-installer/raw/master/bin/rbenv-installer | bash
xbps-install -Sy libressl-devel readline-devel zlib-devel libyaml-devel
xbps-install -Sy sqlite-devel
xbps-install -y libxml2-devel libxslt-devel libcurl-devel libffi-devel

# echo 'calling npm config set prefix '~/.npm-global' so npm bins are in home dir'
# npm config set prefix '~/.npm-global'

pip install --user cargo autorandr

echo '====== random notes ======'
echo 'add fs.inotify.max_user_watches = 32768 to /etc/sysctl.conf'
echo 'usermod -aG sock <username> if you want log reading access'
echo 'svlogtail for simple access'
echo 'to force sync time: sudo chronyc -a makestep'

echo '====== laptop notes ======'
echo 'on laptop you might want to install'
echo 'xbps-install -Sy tlp powertop laptop-mode'
echo 'or look into pm-utils?'

echo '====== bluetooth notes ======'
echo 'add user to bluetooth group'
echo 'load-module module-bluetooth-policy'
echo 'load-module module-bluetooth-discover'

echo '====== to disable ipv6: ======'
echo 'GRUB_CMDLINE_LINUX_DEFAULT="rd.lvm.lv=rhel/swap crashkernel=auto rd.lvm.lv=rhel/root ipv6.disable=1"'
echo 'update-grub'

echo '===== ruby rbenv ====='
echo 'leasebuddyapi uses ruby 2.7.0'
echo 'rbenv install 2.7.0'
echo 'rbenv global 2.7.0'

echo '====== postgresql is done well with docker ======'
echo 'sudo docker run --name postgresql -p 5432:5432 -e POSTGRESQL_PASSWORD=postgres -d postgres'
echo 'specify localhost to use tcp instead of socket:'
echo 'psql -U postgres -h localhost'

echo '====== groups ======'
echo '-- must add user to acpid group (for power management)'
echo '-- must add user to kvm group'
echo '-- must add user to libvirt group'
