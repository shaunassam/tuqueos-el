#!/usr/bin/bash

set -eoux pipefail

rsync -rvK /ctx/system_files/usr/share/backgrounds/ /usr/share/backgrounds/

tee /etc/dconf/db/local.d/01-tuqueos-defaults << EOF
[org.gnome.desktop.background]
picture-uri='file:///usr/share/backgrounds/jasper.jpg'
picture-uri-dark='file:///usr/share/backgrounds/jasper.jpg'

[org/gnome/Ptyxis]
default-columns=uint32 86
default-profile-uuid='9559f421ac4e8a13a3e958c2695b07f2'
font-name='Source Code Pro 14'
profile-uuids=['9559f421ac4e8a13a3e958c2695b07f2']
restore-session=true
restore-window-size=false
use-system-font=false
window-size=(uint32 86, uint32 25)

[org/gnome/control-center]
last-panel='system'
window-state=(980, 640, false)

[org/gnome/desktop/app-folders]
folder-children=['System', 'Utilities', 'YaST', 'Pardus']

[org/gnome/desktop/app-folders/folders/Pardus]
categories=['X-Pardus-Apps']
name='X-Pardus-Apps.directory'
translate=true

[org/gnome/desktop/app-folders/folders/System]
apps=['org.gnome.baobab.desktop', 'org.gnome.DiskUtility.desktop', 'org.gnome.Logs.desktop', 'org.freedesktop.MalcontentControl.desktop', 'org.gnome.SystemMonitor.desktop']
name='X-GNOME-Shell-System.directory'
translate=true

[org/gnome/desktop/app-folders/folders/Utilities]
apps=['org.gnome.Connections.desktop', 'org.gnome.Papers.desktop', 'org.gnome.font-viewer.desktop', 'org.gnome.Loupe.desktop']
name='X-GNOME-Shell-Utilities.directory'
translate=true

[org/gnome/desktop/app-folders/folders/YaST]
categories=['X-SuSE-YaST']
name='suse-yast.directory'
translate=true

[org/gnome/desktop/calendar]
show-weekdate=true

[org/gnome/desktop/input-sources]
current=uint32 0
sources=[('xkb', 'us')]

[org/gnome/desktop/interface]
clock-format='12h'
clock-show-weekday=true
enable-animations=true

[org/gnome/desktop/notifications]
application-children=['org-gnome-ptyxis', 'org-gnome-software', 'gnome-power-panel', 'gnome-about-panel']

[org/gnome/desktop/notifications/application/gnome-about-panel]
application-id='gnome-about-panel.desktop'

[org/gnome/desktop/notifications/application/gnome-power-panel]
application-id='gnome-power-panel.desktop'

[org/gnome/desktop/notifications/application/org-gnome-ptyxis]
application-id='org.gnome.Ptyxis.desktop'

[org/gnome/desktop/notifications/application/org-gnome-software]
application-id='org.gnome.Software.desktop'

[org/gnome/desktop/privacy]
report-technical-problems=false

[org/gnome/desktop/session]
idle-delay=uint32 0

[org/gnome/desktop/wm/preferences]
button-layout='appmenu:minimize,maximize,close'

[org/gnome/gnome-system-monitor/proctree]
col-26-visible=false
col-26-width=0

[org/gnome/login-screen]
enable-fingerprint-authentication=true
enable-smartcard-authentication=false

[org/gnome/nautilus/preferences]
default-folder-viewer='icon-view'
migrated-gtk-settings=true

[org/gnome/nautilus/window-state]
initial-size=(890, 550)

[org/gnome/settings-daemon/plugins/color]
night-light-schedule-automatic=false

[org/gnome/settings-daemon/plugins/housekeeping]
donation-reminder-last-shown=int64 1767588085943437

[org/gnome/shell]
enabled-extensions=['logomenu@aryan_k', 'appindicatorsupport@rgcjonas.gmail.com', 'dash-to-dock@micxgx.gmail.com', 'just-perfection-desktop@just-perfection']
favorite-apps=['org.gnome.Nautilus.desktop', 'org.gnome.Ptyxis.desktop', 'org.mozilla.firefox.desktop', 'org.gnome.Software.desktop', 'org.gnome.Settings.desktop']
last-selected-power-profile='performance'
welcome-dialog-last-shown-version='49.1'

[org/gnome/shell/extensions/Logo-menu]
show-lockscreen=true
show-power-options=true

[org/gnome/shell/extensions/dash-to-dock]
background-opacity=0.80000000000000004
custom-theme-shrink=false
dash-max-icon-size=42
dock-position='BOTTOM'
height-fraction=0.90000000000000002
show-show-apps-button=true

[org/gnome/shell/extensions/just-perfection]
clock-menu-position=1
clock-menu-position-offset=20
notification-banner-position=2
osd-position=3
power-icon=false
show-apps-button=true
startup-status=0
workspace-switcher-should-show=false

[org/gnome/shell/extensions/blur-my-shell]
settings-version=2

[org/gnome/shell/extensions/blur-my-shell/appfolder]
brightness=0.59999999999999998
sigma=30

[org/gnome/shell/extensions/blur-my-shell/dash-to-dock]
blur=false

[org/gnome/shell/extensions/blur-my-shell/panel]
brightness=0.59999999999999998
sigma=30

[org/gnome/shell/extensions/blur-my-shell/window-list]
brightness=0.59999999999999998
sigma=30

[org/gnome/software]
allow-updates=false
check-timestamp=int64 1767637558
download-updates=false
download-updates-notify=false
first-run=false
flatpak-purge-timestamp=int64 1767591689
update-notification-timestamp=int64 1767573812

[org/gnome/system/location]
enabled=false

[org/gnome/tweaks]
show-extensions-notice=false

[org/gtk/gtk4/settings/file-chooser]
show-hidden=false
sort-directories-first=true

[org/gtk/settings/file-chooser]
clock-format='12h'
EOF

dconf update
