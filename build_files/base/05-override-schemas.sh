#!/usr/bin/bash

set -eoux pipefail

rsync -rvK /ctx/system_files/usr/share/backgrounds/ /usr/share/backgrounds/

tee /usr/share/glib-2.0/schemas/zz1-tuqueos-desktop-modifications.gschema.override << EOF
[org.gnome.desktop.background]
picture-uri='file:///usr/share/backgrounds/jasper.jpg'
picture-uri-dark='file:///usr/share/backgrounds/jasper.jpg'

[org.gnome.software]
allow-updates=false
download-updates=false
first-run=false
packaging-format-preference=["flatpak:flathub", "flatpak"]

[org.gnome.shell]
enabled-extensions=['logomenu@aryan_k', 'appindicatorsupport@rgcjonas.gmail.com', 'dash-to-dock@micxgx.gmail.com', 'just-perfection-desktop@just-perfection', 'apps-menu@gnome-shell-extensions.gcampax.github.com', 'places-menu@gnome-shell-extensions.gcampax.github.com']
favorite-apps=['org.gnome.Nautilus.desktop', 'org.gnome.Ptyxis.desktop', 'org.mozilla.firefox.desktop', org.mozilla.Thunderbird.desktop, 'org.gnome.TextEditor.desktop', 'org.gnome.Software.desktop', 'org.gnome.Settings.desktop']

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

[org.gnome.shell.extensions.just-perfection]
accent-color-icon=false
accessibility-menu=true
activities-button=true
animation=1
background-menu=true
clock-menu=true
clock-menu-position=1
clock-menu-position-offset=20
controls-manager-spacing-size=0
dash=true
dash-icon-size=0
dash-separator=true
double-super-to-appgrid=true
invert-calendar-column-items=false
notification-banner-position=2
osd=true
osd-position=3
panel=true
panel-button-padding-size=0
panel-icon-size=0
panel-in-overview=true
panel-indicator-padding-size=0
panel-notification-icon=false
power-icon=false
quick-settings=true
ripple-box=true
search=true
show-apps-button=false
startup-status=0
support-notifier-type=0
switcher-popup-delay=false
theme=false
window-demands-attention-focus=false
window-picker-icon=true
window-preview-caption=true
window-preview-close-button=true
workspace=true
workspace-background-corner-size=1
workspace-popup=true
workspace-switcher-should-show=true
workspaces-in-app-grid=true

[org.gnome.shell.extensions.Logo-menu]
menu-button-extensions-app='com.mattjakeman.ExtensionManager.desktop'
menu-button-icon-image=1
menu-button-terminal='ptyxis'
show-activities-button=true
symbolic-icon=true
use-custom-icon=false
EOF
