#!/usr/bin/env bash

set -eoux pipefail

# IMAGE_INFO="$(cat /usr/share/ublue-os/image-info.json)"
# IMAGE_TAG=latest
# IMAGE_REF="$(jq -c -r '."image-ref"' <<<"$IMAGE_INFO")"
# IMAGE_REF="${IMAGE_REF##*://}"

# Configure Live Environment

# Setup dock
tee /usr/share/glib-2.0/schemas/zz2-org.gnome.shell.gschema.override <<EOF
[org.gnome.shell]
welcome-dialog-last-shown-version='4294967295'
favorite-apps = ['anaconda.desktop', 'org.mozilla.firefox.desktop', 'org.gnome.Nautilus.desktop']
EOF

# Disable suspend/sleep during live environment and initial setup
# This prevents the system from suspending during installation or first-boot user creation
tee /usr/share/glib-2.0/schemas/zz3-tuqueos-installer-power.gschema.override <<EOF
[org.gnome.settings-daemon.plugins.power]
sleep-inactive-ac-type='nothing'
sleep-inactive-battery-type='nothing'
sleep-inactive-ac-timeout=0
sleep-inactive-battery-timeout=0

[org.gnome.desktop.session]
idle-delay=uint32 0
EOF

glib-compile-schemas /usr/share/glib-2.0/schemas

systemctl disable rpm-ostree-countme.service
#systemctl disable tailscaled.service
systemctl disable bootloader-update.service
# systemctl disable brew-upgrade.timer
# systemctl disable brew-update.timer
# systemctl disable brew-setup.service
systemctl disable rpm-ostreed-automatic.timer
#systemctl disable uupd.timer
#systemctl disable ublue-system-setup.service
# systemctl disable ublue-guest-user.service
#systemctl disable check-sb-key.service
# systemctl --global disable ublue-flatpak-manager.service
#systemctl --global disable podman-auto-update.timer
#systemctl --global disable ublue-user-setup.service

# Configure Anaconda

# remove anaconda-liveinst to be replaced with anaconda-live
dnf remove -y anaconda-liveinst

# Install Anaconda, Webui if >= F42
SPECS=(
    "libdnf5"
    "python3-libdnf5"
    "libblockdev"
    "libblockdev-lvm"
    "libblockdev-dm"
    "libblockdev-btrfs"
    "anaconda-live"
    "anaconda-webui-49"
    "firefox"
)

dnf copr enable -y jreilly1821/anaconda-webui

dnf install -y --nobest "${SPECS[@]}"


# Fix the wrong dir for webui
sed -i 's|/usr/libexec/webui-desktop|/usr/libexec/anaconda/webui-desktop|g' /bin/liveinst

# Anaconda Profile Detection

# TuqueOS
tee /etc/anaconda/profile.d/tuqueos.conf <<'EOF'
# Anaconda configuration file for TuqueOS

[Profile]
# Define the profile.
profile_id = tuqueos

[Profile Detection]
# Match os-release values
os_id = tuqueos

[Network]
default_on_boot = FIRST_WIRED_WITH_LINK

[Bootloader]
efi_dir = centos
menu_auto_hide = True

[Storage]
file_system_type = xfs
default_partitioning =
    /     (min 5 GiB, max 70 GiB)
    /var  (min 5 GiB)

[User Interface]
custom_stylesheet = /usr/share/anaconda/pixmaps/silverblue/fedora-silverblue.css
hidden_spokes =
    NetworkSpoke
    PasswordSpoke
    UserSpoke
hidden_webui_pages =
    anaconda-screen-accounts

[Localization]
use_geolocation = False
EOF

sed -i 's/^ID=.*/ID=tuqueos/' /usr/lib/os-release
echo "VARIANT_ID=tuqueos" >>/usr/lib/os-release

# Configure
. /etc/os-release
echo "TuqueOS release 1.1 (Jasper)" >/etc/system-release
sed -i 's/ANACONDA_PRODUCTVERSION=.*/ANACONDA_PRODUCTVERSION=""/' /usr/{,s}bin/liveinst || true
sed -i 's|^Icon=.*|Icon=/usr/share/pixmaps/fedora-logo-icon.png|' /usr/share/applications/liveinst.desktop || true
sed -i 's| Fedora| TuqueOS|' /usr/share/anaconda/gnome/fedora-welcome || true
sed -i 's|Activities|in the dock|' /usr/share/anaconda/gnome/fedora-welcome || true

# Get Artwork
git clone --depth=1 https://github.com/projectbluefin/branding.git /tmp/branding
mkdir -p /usr/share/anaconda/pixmaps/silverblue
cp -r /tmp/branding/anaconda/* /usr/share/anaconda/pixmaps/silverblue/
rm -rf /tmp/branding

# Interactive Kickstart
tee -a /usr/share/anaconda/interactive-defaults.ks <<EOF
ostreecontainer --url=tuqueos-lts:latest --transport=containers-storage --no-signature-verification
%include /usr/share/anaconda/post-scripts/install-configure-upgrade.ks
%include /usr/share/anaconda/post-scripts/install-flatpaks.ks
EOF

# Container Image
tee /usr/share/anaconda/post-scripts/install-configure-upgrade.ks <<EOF
%post --erroronfail
bootc switch --mutate-in-place --transport registry ghcr.io/shaunassam/tuqueos-el:latest
%end
EOF

# Install Flatpaks
tee /usr/share/anaconda/post-scripts/install-flatpaks.ks <<'EOF'
%post --erroronfail --nochroot
deployment="$(ostree rev-parse --repo=/mnt/sysimage/ostree/repo ostree/0/1/0)"
target="/mnt/sysimage/ostree/deploy/default/deploy/$deployment.0/var/lib/"
mkdir -p "$target"
rsync -aAXUHKP /var/lib/flatpak "$target"
%end
EOF

sed -i -e "s/Fedora/TuqueOS/g" -e "s/CentOS/TuqueOS/g" /usr/share/anaconda/gnome/org.fedoraproject.welcome-screen.desktop