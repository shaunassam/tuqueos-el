#!/usr/bin/bash

flatpak remote-add --if-not-exists flathub https://dl.flathub.org/repo/flathub.flatpakrepo && \
flatpak install --system -y --noninteractive flathub \
    org.gnome.Calendar \
    org.gnome.Snapshot \
    org.gnome.Connections \
    org.gnome.Contacts \
    org.gnome.Maps \
    org.gnome.Loupe \
    org.gnome.Weather \
    com.mattjakeman.ExtensionManager \
    org.gnome.Firmware