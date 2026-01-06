#!/bin/bash

set -ouex pipefail

### Install packages

# Packages can be installed from any enabled yum repo on the image.
# RPMfusion repos are available by default in ublue main images
# List of rpmfusion packages can be found here:
# https://mirrors.rpmfusion.org/mirrorlist?path=free/fedora/updates/39/x86_64/repoview/index.html&protocol=https&redirect=1

dnf5 remove -y gnome-extensions-app

# Adding Fedora Workstation and additional packages
dnf5 install -y gnome-tweaks distrobox vim-enhanced samba fuse-sshfs dconf \
  gnome-shell-extension-dash-to-dock gnome-shell-extension-just-perfection gnome-shell-extension-appindicator \
  gnome-shell-extension-apps-menu gnome-shell-extension-places-menu \
  ffmpeg-free flac faad2 lame libmad

#### Install Desktop Packages
#/ctx/base/01-desktop.sh

# Use a COPR Example:
#
# dnf5 -y copr enable ublue-os/staging
# dnf5 -y install package
# Disable COPRs so they don't end up enabled on the final image:
# dnf5 -y copr disable ublue-os/staging

dnf5 -y copr enable sassam/tuqueOS
dnf5 -y install gnome-shell-extension-logo-menu

#### Example for enabling a System Unit File

#systemctl enable podman.socket
systemctl enable smb nmb

#### Apply Flatpaks
/ctx/base/04-flatpaks

#### Apply Overrides 
/ctx/base/08-override-schemas.sh

#### Clean up
# /ctx/base/09-cleanup.sh
