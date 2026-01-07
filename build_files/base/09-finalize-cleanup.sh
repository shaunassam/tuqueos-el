#!/usr/bin/bash

#### Final configurations

# Add Flathub by default
mkdir -p /etc/flatpak/remotes.d
curl --retry 3 -o /etc/flatpak/remotes.d/flathub.flatpakrepo "https://dl.flathub.org/repo/flathub.flatpakrepo"

# System services
systemctl enable smb nmb && \
systemctl enable gdm.service && \
systemctl enable firewalld.service && \
systemctl enable tuned-ppd.service && \
systemctl enable fwupd.service && \
systemctl enable dconf-update.service && \
systemctl disable rpm-ostree.service && \
systemctl mask bootc-fetch-apply-updates.timer bootc-fetch-apply-updates.service

# Disable lastlog display on previous failed login in GDM (This makes logins slow)
authselect enable-feature with-silent-lastlog

# Enable polkit rules for fingerprint sensors via fprintd
authselect enable-feature with-fingerprint

sed -i -e "s@PrivateTmp=.*@PrivateTmp=no@g" /usr/lib/systemd/system/systemd-resolved.service
# FIXME: this does not yet work, the resolution service fails for somer reason
# enable systemd-resolved for proper name resolution
systemctl enable systemd-resolved.service
