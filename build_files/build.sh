#!/bin/bash

set -ouex pipefail

### Install packages

# Packages can be installed from any enabled yum repo on the image.
# RPMfusion repos are available by default in ublue main images
# List of rpmfusion packages can be found here:
# https://mirrors.rpmfusion.org/mirrorlist?path=free/fedora/updates/39/x86_64/repoview/index.html&protocol=https&redirect=1

# this installs a package from fedora repos
dnf5 install -y gnome-tweaks distrobox vim-enhanced samba fuse-sshfs gnome-shell-extension-dash-to-dock gnome-shell-extension-appindicator

# Use a COPR Example:
#
# dnf5 -y copr enable ublue-os/staging
# dnf5 -y install package
# Disable COPRs so they don't end up enabled on the final image:
# dnf5 -y copr disable ublue-os/staging

dnf5 -y copr enable lilay/topgrade
dnf5 -y install topgrade
dnf5 -y copr enable sassam/tuqueOS
dnf5 -y install gnome-shell-extension-logo-menu

#### Example for enabling a System Unit File

#systemctl enable podman.socket
systemctl enable smb nmb

#### Install Stable Kernel
/ctx/base/01-replace-kernel.sh

# Install Overrides 
/ctx/base/05-override-schemas.sh

