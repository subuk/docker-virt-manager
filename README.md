# docker-virt-manager

New virt-manager version from fedora 21 which much faster than shipped with ubuntu 14.04

## Build

    docker build -t subuk/virt-manager ./

## Installation

Build (see above) or pull from docker hub:

    docker pull subuk/virt-manager

Create local folder for preserve configuration between runs:

    mkdir -p ~/.docker-libvirt-config

Run container:
    
    docker run --rm -it \
        -v $HOME/.docker-libvirt-config:/home/app/.config/dconf \
        -v $HOME/.ssh/known_hosts:/home/app/.ssh/known_hosts \
        -v $SSH_AUTH_SOCK:$SSH_AUTH_SOCK -e SSH_AUTH_SOCK=$SSH_AUTH_SOCK \
        -v /usr/share/fonts:/usr/share/fonts:ro \
        -v /tmp/.X11-unix:/tmp/.X11-unix -e DISPLAY="$DISPLAY" \
        subuk/virt-manager

You also can override default virt-manager .desktop file by creating **~/.local/share/applications/virt-manager.desktop** with the following content:

    [Desktop Entry]
    Name=Virtual Machine Manager
    Comment=Manage virtual machines
    Icon=virt-manager
    Exec=/bin/sh -c "docker run --rm -v \$HOME/.docker-libvirt-config:/home/app/.config/dconf -v \$HOME/.ssh/known_hosts:/home/app/.ssh/known_hosts -v \$SSH_AUTH_SOCK:\$SSH_AUTH_SOCK -e SSH_AUTH_SOCK=\$SSH_AUTH_SOCK -v /usr/share/fonts:/usr/share/fonts:ro -v /tmp/.X11-unix:/tmp/.X11-unix -e DISPLAY=\$DISPLAY subuk/virt-manager"
    Type=Application
    Terminal=false
    Categories=System;
