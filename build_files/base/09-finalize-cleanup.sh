#!/usr/bin/bash

#### Final configurations

# Add Flathub by default & remove Red Hat flatpak repo
mkdir -p /etc/flatpak/remotes.d
curl --retry 3 -o /etc/flatpak/remotes.d/flathub.flatpakrepo "https://dl.flathub.org/repo/flathub.flatpakrepo"
flatpak remote-delete rhel

# Add release background
rsync -rvK /ctx/system_files/usr/share/backgrounds/ /usr/share/backgrounds/
rsync -rvK /ctx/system_files/usr/share/gnome-background-properties/ /usr/share/gnome-background-properties/

# Fix for tuned-ppd.service failing to start after installation
rsync -rvK /ctx/system_files/etc/systemd/system/firstboot-fixes.service /etc/systemd/system/firstboot-fixes.service

# System services
systemctl enable smb nmb
systemctl enable firstboot-fixes.service
#systemctl enable gdm.service && \
#systemctl enable firewalld.service && \
#systemctl enable tuned-ppd.service && \
#systemctl enable fwupd.service && \
#systemctl disable rpm-ostree.service && \
#systemctl mask bootc-fetch-apply-updates.timer bootc-fetch-apply-updates.service

# Disable lastlog display on previous failed login in GDM (This makes logins slow)
#authselect enable-feature with-silent-lastlog

# Enable polkit rules for fingerprint sensors via fprintd
authselect enable-feature with-fingerprint

#sed -i -e "s@PrivateTmp=.*@PrivateTmp=no@g" /usr/lib/systemd/system/systemd-resolved.service
# FIXME: this does not yet work, the resolution service fails for somer reason
# enable systemd-resolved for proper name resolution
#systemctl enable systemd-resolved.service

dnf clean all && \
    rm -rf /var/cache/dnf