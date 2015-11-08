# docker-virt-manager

New virt-manager version from fedora 21 which much faster than shipped with ubuntu 14.04


## Build

docker build -t subuk/virt-manager .


## Installation

Create container:
    
    docker create --name virt-manager -v $HOME/.ssh/known_hosts:/home/app/.ssh/known_hosts -v $SSH_AUTH_SOCK:$SSH_AUTH_SOCK -e SSH_AUTH_SOCK=$SSH_AUTH_SOCK -v /usr/share/fonts:/usr/share/fonts -v /tmp/.X11-unix:/tmp/.X11-unix -e DISPLAY="$DISPLAY" subuk/virt-manager

Override default virt-manager .desktop file by creating ~/.local/share/applications/virt-manager.desktop with the following content:

    [Desktop Entry]
    Name=Virtual Machine Manager
    Comment=Manage virtual machines
    Icon=virt-manager
    Exec=docker start virt-manager
    Type=Application
    Terminal=false
    Categories=System;
    X-Ubuntu-Gettext-Domain=virt-manager

Launch it as you usually lauch virt-manager
