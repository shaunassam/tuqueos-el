#!/bin/bash

set -ouex pipefail

### Install packages

# Packages can be installed from any enabled yum repo on the image.
# RPMfusion repos are available by default in ublue main images
# List of rpmfusion packages can be found here:
# https://mirrors.rpmfusion.org/mirrorlist?path=free/fedora/updates/39/x86_64/repoview/index.html&protocol=https&redirect=1

# Adding Fedora Workstation and additional packages
dnf5 install -y @gnome-desktop gnome-tweaks distrobox flatpak vim-enhanced samba fuse-sshfs \
  nss-mdns avahi-dnsconfd dbus-broker plymouth plymouth-theme-spinner \
  gnome-shell-extension-dash-to-dock gnome-shell-extension-just-perfection gnome-shell-extension-appindicator \
  gnome-shell-extension-apps-menu gnome-shell-extension-places-menu \
  vlc vlc-plugins-all ffmpeg-free flac faad2 lame libmad \
  amd-ucode-firmware dnf5 intel-gpu-firmware linux-firmware microcode_ctl nvidia-gpu-firmware \
  sudo systemd-udev tar abrt-cli abrt-desktop acl attr bash-color-prompt bash-completion \
  bc bind-utils btrfs-progs bzip2 chrony cifs-utils compsize cpio cryptsetup cyrus-sasl-plain \
  default-editor deltarpm desktop-backgrounds-gnome dnf5-plugins dos2unix dosfstools ethtool exfatprogs \
  fedora-chromium-config fedora-flathub-remote fedora-release-workstation fedora-workstation-backgrounds \
  fedora-workstation-repositories file fpaste gamemode git glibc-all-langpacks \
  gnupg2 hunspell ibus-anthy ibus-chewing ibus-gtk3 ibus-gtk4 ibus-hangul ibus-libpinyin ibus-m17n ibus-typing-booster \
  iptstate logrotate lrzsz lsof mailcap man-pages mcelog mdadm mediawriter mtr net-tools nfs-utils nmap-ncat nss-mdns \
  ntfs-3g ntfsprogs opensc pam_afs_session passwdqc pciutils pinentry-gnome3 pinfo plocate plymouth-system-theme \
  policycoreutils-python-utils psacct psmisc qadwaitadecorations-qt5 qt5-qtbase qt5-qtbase-gui qt5-qtdeclarative \
  qt5-qtxmlpatterns quota realmd rsync sos symlinks systemd-oomd-defaults tcpdump thermald time toolbox traceroute \
  tree unoconv unzip uresourced usbutils wget2-wget which whois words zip

# Use a COPR Example:
#
# dnf5 -y copr enable ublue-os/staging
# dnf5 -y install package
# Disable COPRs so they don't end up enabled on the final image:
# dnf5 -y copr disable ublue-os/staging

#### Example for enabling a System Unit File

#systemctl enable podman.socket
systemctl enable smb nmb

#### Install Stable Kernel
# /ctx/base/01-replace-kernel.sh

#### Apply Overrides 
/ctx/base/05-override-schemas.sh

#### Clean up
# /ctx/base/09-cleanup.sh
