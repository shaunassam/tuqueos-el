#!/usr/bin/bash

set -eoux pipefail

tee /usr/share/glib-2.0/schemas/zz1-tuqueos-desktop-modifications.gschema.override << EOF
[org.gnome.desktop.background]
picture-uri='file:///usr/share/backgrounds/true-north-day.jpg'
picture-uri-dark='file:///usr/share/backgrounds/true-north-night.jpg'

[org.gnome.software]
allow-updates=false
download-updates=false
first-run=false
packaging-format-preference='["flatpak:flathub", "flatpak", "rpm"]'

[org.gnome.shell]
enabled-extensions=['appindicatorsupport@rgcjonas.gmail.com', 'dash-to-dock@micxgx.gmail.com', 'logomenu@aryan_k', 'fildemGMenu@gonza.com']
favorite-apps=['org.gnome.Nautilus.desktop', 'org.gnome.Ptyxis.desktop', 'org.mozilla.firefox.desktop', 'org.gnome.TextEditor.desktop', 'org.gnome.Software.desktop', 'org.gnome.Settings.desktop']

[org.gnome.desktop.wm.preferences]
button-layout='appmenu:minimize,maximize,close'

[org.gtk.settings.file-chooser]
clock-format='12h'

[org.gtk.gtk4.settings.file-chooser]
sort-directories-first=true

[org.gnome.nautilus.icon-view]
default-zoom-level='small-plus'

[org.gnome.nautilus.window-state]
initial-size=(890, 550)
initial-size-file-chooser=(890, 550)

[org.gnome.settings-daemon/plugins/custom-keybindings/custom0]
name='Terminal'
binding='<Super>t'
command='ptyxis --new-window'

[org.gnome.shell.extensions.dash-to-dock]
dock-fixed=false
icon-size-fixed=true
intellihide-mode='ALL_WINDOWS'
show-apps-at-top=true
custom-theme-shrink=true
disable-overview-on-startup=true
apply-custom-theme=true
dash-max-icon-size=42
click-action='minimize-or-overview'
dock-position='BOTTOM'

[org.gnome.shell.extensions.Logo-menu]
menu-button-extensions-app='com.mattjakeman.ExtensionManager.desktop'
menu-button-icon-image=1
menu-button-terminal='ptyxis'
show-activities-button=true
symbolic-icon=true
use-custom-icon=false
EOF
