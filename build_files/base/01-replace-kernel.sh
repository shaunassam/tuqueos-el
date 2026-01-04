#!/usr/bin/bash

## Purpose of this script is to remove installed kernel and replace them
## with the kernel version used in Fedora CoreOS Stable. This avoids
## constant kernel updates in hopes tuqueOS distro maintains stability.

set -eoux pipefail

FEDORA_VERSION=43
KERNEL_VERSION=6.17.8
KERNEL_SUBVERSION=300
KERNEL_PKGS=(kernel kernel-core kernel-tools kernel-tools-libs kernel-modules kernel-modules-core kernel-modules-extra)
KERNEL_URL="https://kojipkgs.fedoraproject.org//packages/kernel/${KERNEL_VERSION}/${KERNEL_SUBVERSION}.fc${FEDORA_VERSION}/x86_64/"

# Remove Existing Kernel
for rempkg in "${KERNEL_PKGS[@]}"; do
    rpm --erase $rempkg --nodeps
done

# Install Kernel directly from koji (using CoreOS Stable kernel version)
for instpkg in "${KERNEL_PKGS[@]}"; do
	dnf5 -y install $KERNEL_URL/$instpkg-$KERNEL_VERSION-$KERNEL_SUBVERSION.fc$FEDORA_VERSION.x86_64.rpm
done

# Lock kernel packages to prevent kernel updates
for lockpkg in "${KERNEL_PKGS[@]}"; do
	dnf5 versionlock add $lockpkg
done

