#!/bin/sh

# check with
# mount | grep efivars

# remount with
mount -o remount,rw -t efivarfs efivarfs /sys/firmware/efi/efivars
