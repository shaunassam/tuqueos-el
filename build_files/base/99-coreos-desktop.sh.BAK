#!/usr/bin/bash

## Purpose of this script is to remove installed kernel and replace them
## with the kernel version used in Fedora CoreOS Stable. This avoids
## constant kernel updates in hopes tuqueOS distro maintains stability.

set -eoux pipefail

dnf5 install -y \
@gnome-desktop gnome-tweaks distrobox flatpak vim-enhanced samba fuse-sshfs \
nss-mdns avahi-dnsconfd dbus-broker plymouth plymouth-theme-spinner \
gnome-shell-extension-dash-to-dock gnome-shell-extension-just-perfection gnome-shell-extension-appindicator \
gnome-shell-extension-apps-menu gnome-shell-extension-places-menu \
vlc vlc-plugins-all ffmpeg-free flac faad2 lame libmad \
glx-utils mesa-dri-drivers mesa-vulkan-drivers xorg-x11-drv-amdgpu xorg-x11-drv-ati \
xorg-x11-drv-evdev xorg-x11-drv-intel xorg-x11-drv-libinput xorg-x11-drv-nouveau xorg-x11-drv-openchrome \
xorg-x11-drv-qxl xorg-x11-drv-vmware xorg-x11-drv-wacom xorg-x11-server-Xorg xorg-x11-xauth xorg-x11-xinit \
default-fonts-cjk-mono default-fonts-cjk-sans default-fonts-cjk-serif default-fonts-core-emoji default-fonts-core-math \
default-fonts-core-mono default-fonts-core-sans default-fonts-core-serif default-fonts-other-mono default-fonts-other-sans \
default-fonts-other-serif adobe-source-code-pro-fonts adobe-source-han-code-jp-fonts adobe-source-han-sans-cn-fonts \
adobe-source-han-sans-jp-fonts adobe-source-han-sans-kr-fonts adobe-source-han-sans-tw-fonts adobe-source-han-serif-cn-fonts \
adobe-source-han-serif-jp-fonts adobe-source-han-serif-kr-fonts adobe-source-han-serif-tw-fonts adobe-source-sans-pro-fonts \
adobe-source-serif-pro-fonts bitstream-vera-sans-fonts bitstream-vera-sans-mono-fonts bitstream-vera-serif-fonts cf-bonveno-fonts \
comic-neue-fonts darkgarden-fonts dejavu-lgc-sans-fonts dejavu-lgc-sans-mono-fonts dejavu-lgc-serif-fonts dejavu-sans-fonts \
dejavu-sans-mono-fonts dejavu-serif-fonts ecolier-court-fonts fontawesome-fonts-all fontawesome4-fonts fontsquirrel-crete-round-fonts \
freecol-imperator-fonts gfs-ambrosia-fonts gfs-artemisia-fonts gfs-baskerville-fonts gfs-bodoni-classic-fonts gfs-bodoni-fonts \
gfs-complutum-fonts gfs-decker-fonts gfs-didot-classic-fonts gfs-didot-fonts gfs-eustace-fonts gfs-fleischman-fonts gfs-garaldus-fonts \
gfs-gazis-fonts gfs-goschen-fonts gfs-ignacio-fonts gfs-jackson-fonts gfs-neohellenic-fonts gfs-nicefore-fonts gfs-olga-fonts \
gfs-philostratos-fonts gfs-porson-fonts gfs-pyrsos-fonts gfs-solomos-fonts gfs-theokritos-fonts glyphicons-halflings-fonts \
gnu-free-mono-fonts gnu-free-sans-fonts gnu-free-serif-fonts google-arimo-fonts google-carlito-fonts google-cousine-fonts \
google-crosextra-caladea-fonts google-droid-sans-fonts google-droid-sans-mono-fonts google-droid-serif-fonts \
google-noto-emoji-fonts google-noto-fonts-all google-roboto-condensed-fonts google-roboto-fonts google-roboto-mono-fonts \
google-roboto-slab-fonts google-tinos-fonts ht-alegreya-fonts julietaula-montserrat-fonts liberation-narrow-fonts \
linux-libertine-biolinum-fonts linux-libertine-fonts open-sans-fonts oxygen-mono-fonts oxygen-sans-fonts twitter-twemoji-fonts \
typetype-molot-fonts urw-base35-bookman-fonts urw-base35-c059-fonts urw-base35-d050000l-fonts urw-base35-fonts \
urw-base35-gothic-fonts urw-base35-nimbus-mono-ps-fonts urw-base35-nimbus-roman-fonts urw-base35-nimbus-sans-fonts urw-base35-p052-fonts \
urw-base35-standard-symbols-ps-fonts urw-base35-z003-fonts hyperv-daemons open-vm-tools-desktop qemu-guest-agent spice-vdagent \
spice-webdavd virtualbox-guest-additions alsa-sof-firmware amd-gpu-firmware atheros-firmware b43-fwcutter b43-openfwwf \
brcmfmac-firmware cirrus-audio-firmware intel-audio-firmware intel-gpu-firmware intel-vsc-firmware iwlegacy-firmware \
iwlwifi-dvm-firmware iwlwifi-mvm-firmware libertas-firmware mt7xxx-firmware nvidia-gpu-firmware nxpwireless-firmware \
qcom-wwan-firmware realtek-firmware tiwilink-firmware usb_modeswitch \PackageKit-gstreamer-plugin alsa-ucm alsa-utils \
gstreamer1-plugin-dav1d gstreamer1-plugin-libav gstreamer1-plugin-openh264 gstreamer1-plugins-bad-free gstreamer1-plugins-good \
gstreamer1-plugins-ugly-free libva-intel-media-driver pipewire-alsa pipewire-config-raop pipewire-gstreamer pipewire-pulseaudio \
pipewire-utils wireplumber NetworkManager-bluetooth NetworkManager-wifi NetworkManager-wwan dhcp-client dnsmasq iptables-nft \
wpa_supplicant \cups cups-filters ghostscript bluez-cups colord cups-browsed cups-pk-helper gutenprint gutenprint-cups hplip \
mpage nss-mdns paps samba-client system-config-printer-udev amd-ucode-firmware dnf5 intel-gpu-firmware linux-firmware \
microcode_ctl nvidia-gpu-firmware sudo systemd-udev tar NetworkManager-config-connectivity-fedora abrt-cli abrt-desktop acl \
attr bash-color-prompt bash-completion bc bind-utils btrfs-progs bzip2 chrony cifs-utils compsize cpio cryptsetup cyrus-sasl-plain \
default-editor deltarpm desktop-backgrounds-gnome dnf5-plugins dos2unix dosfstools ethtool exfatprogs fedora-chromium-config \
fedora-flathub-remote fedora-release-workstation fedora-workstation-backgrounds fedora-workstation-repositories file \
fpaste gamemode git glibc-all-langpacks gnome-shell-extension-background-logo gnupg2 hunspell ibus-anthy ibus-chewing ibus-gtk3 \
ibus-gtk4 ibus-hangul ibus-libpinyin ibus-m17n ibus-typing-booster iptstate logrotate lrzsz lsof mailcap man-pages mcelog mdadm \
mediawriter mtr net-tools nfs-utils nmap-ncat nss-mdns ntfs-3g ntfsprogs opensc pam_afs_session passwdqc pciutils pinentry-gnome3 \
pinfo plocate plymouth-system-theme policycoreutils-python-utils psacct psmisc qadwaitadecorations-qt5 qt5-qtbase qt5-qtbase-gui \
qt5-qtdeclarative qt5-qtxmlpatterns quota realmd rsync sos symlinks systemd-oomd-defaults tcpdump thermald time toolbox traceroute \
tree unoconv unzip uresourced usbutils wget2-wget which whois words zip
