#!/bin/bash

xbps-install -Sy mesa-vdpau mesa-vaapi
xbps-install -Sy mesa-vdpau-32bit mesa-vaapi-32bit mesa-dri-32bit
xbps-install -Sy mesa-vulkan-radeon mesa-vulkan-radeon-32bit

echo should we try out RyzenAdj?
