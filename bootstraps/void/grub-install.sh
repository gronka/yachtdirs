#!/bin/sh
 grub-install --target=x86_64-efi --efi-directory=/boot/efi --bootloader-id=void_grub --boot-directory=/boot --recheck --debug

 # not entirely sure what this does
 # xbps-reconfigure -f linux4.0
