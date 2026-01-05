#!/usr/bin/bash

# Remove unwanted packages
dnf remove -y subscription-manager

# Install required packages for tuqueOS image

dnf group install -y \
    "Graphical Administration Tools" \
    "System Tools" \
    "Common NetworkManager submodules" \
	"Core" \
	"Fonts" \
	"Guest Desktop Agents" \
	"Hardware Support" \
	"Printing Client" \
	"Standard" \
	"Workstation product core" \
    "Container Management" \
    "GNOME" \
    "Multimedia" \
    "Network File System Client" \
    "Virtualization Hypervisor" \
    "Virtualization Tools" \
    base-graphical

dnf install -y \
    gnome-tweaks \
    distrobox \
    vim-enhanced \
    samba \
    ntfs-3g \
    ntfsprogs \
    fuse-sshfs \
    gnome-shell-extension-dash-to-dock \
    gnome-shell-extension-just-perfection \
    gnome-shell-extension-appindicator \
    gnome-shell-extension-logo-menu \
    plymouth \
    plymouth-system-theme \
    fwupd
    ffmpeg-free \
    flac \
    faad2 \
    lame \
    libmad \
    vorbis-tools \
    NetworkManager-openconnect-gnome \
    NetworkManager-openvpn-gnome \
    btrfs-progs \
    buildah \
    containerd \
    ddcutil \
    fastfetch \
    firewalld \
    flatpak \
    fpaste \
    fzf \
    glow \
    gnome-disk-utility \
    gum \
    hplip \
    jetbrains-mono-fonts-all \
    just \
    libgda-sqlite \
    nss-mdns \
    papers-thumbnailer \
    powertop \
    rclone \
    restic \
    system-reinstall-bootc \
    tuned-ppd \
    wireguard-tools \
    xhost

dnf remove -y gnome-extensions-app
