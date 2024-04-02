#!/bin/bash
xbps-install -Syu
xbps-install -Sy void-repo-nonfree
xbps-install -Sy void-repo-multilib
xbps-install -Sy void-repo-multilib-nonfree
xbps-install -Syu

xbps-install -Sy alsa-plugins-pulseaudio-32bit nvidia-libs-32bit
xbps-install -Sy libgcc-32bit libstdc++-32bit libdrm-32bit libglvnd-32bit libidn-32bit libidn2-32bit librtmp-32bit libldap-32bit gnutls-32bit

#NOTE: the mesa drivers are for open source drivers
#xbps-install -Sy mesa-32bit
#For users of the open source drivers:
       #- mesa-dri-32bit
#For users of the proprietary NVIDIA driver:
       #- nvidia-libs-32bit (latest nvidia package)
       #- nvidia390-libs-32bit (latest previous package)
       #- nvidia340-libs-32bit (latest package for old GPUs)
#For mesa users this would result in:
       # xbps-install -Syv libgcc-32bit libstdc++-32bit libdrm-32bit libglvnd-32bit mesa-dri-32bit

xbps-install -Sy mono xboxdrv lutris

# Beyon all reason
xbps-install -Sy fuse2fs nss

echo read /usr/share/doc/steam/README.voidlinux
echo run something like this to find libraries: xlocate -S 
echo then: xlocate swrast_dri.so

echo for ms corefonts use winetricks corefonts or xbps-install google-fonts-ttf
