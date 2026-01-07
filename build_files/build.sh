#!/bin/bash

set -ouex pipefail

### Install packages

# Remove unwanted packages
dnf5 remove -y gnome-extensions-app

# Adding Fedora Workstation and additional packages
dnf5 install -y gnome-tweaks distrobox podman vim-enhanced samba fuse-sshfs \
  gnome-shell-extension-dash-to-dock gnome-shell-extension-just-perfection gnome-shell-extension-appindicator \
  gnome-shell-extension-apps-menu gnome-shell-extension-places-menu \
  ffmpeg-free flac faad2 lame libmad

# Enable COPRs & install respective packages:
dnf5 -y copr enable sassam/tuqueOS
dnf5 -y install gnome-shell-extension-logo-menu

#### Apply Flatpaks
/ctx/base/04-flatpaks.sh

#### Apply Overrides 
/ctx/base/08-override-schemas.sh

#### Clean up
/ctx/base/09-finalize-cleanup.sh
