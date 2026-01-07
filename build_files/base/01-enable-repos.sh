#!/usr/bin/bash

#### Enable EPEL, CRB, Flathub, & COPR Repos

dnf install -y epel-release && \
dnf config-manager --set-enabled crb && \
dnf copr enable -y sassam/tuqueOS && \
dnf copr enable -y lilay/topgrade
