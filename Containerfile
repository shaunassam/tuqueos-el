# Allow build scripts to be referenced without being copied into the final image
FROM scratch AS ctx
COPY build_files /

# Base Image

FROM quay.io/fedora/fedora-silverblue:43

# [IM]MUTABLE /opt

RUN rm /opt && mkdir /opt

### MODIFICATIONS
## make modifications desired in your image and install packages by modifying the build.sh script
## the following RUN directive does all the things required to run "build.sh" as recommended. 

RUN --mount=type=bind,from=ctx,source=/,target=/ctx \
    --mount=type=cache,dst=/var/cache \
    --mount=type=cache,dst=/var/log \
    --mount=type=tmpfs,dst=/tmp \
    /ctx/build.sh && \
    rpm-ostree override remove firefox firefox-langpacks && \
    sed -i 's/#AutomaticUpdatePolicy.*/AutomaticUpdatePolicy=stage/' /etc/rpm-ostreed.conf && \
    sed -i 's/#LockLayering.*/LockLayering=true/' /etc/rpm-ostreed.conf && \
    flatpak remote-add --if-not-exists --system flathub https://dl.flathub.org/repo/flathub.flatpakrepo && \
    flatpak install --system flathub org.mozilla.firefox org.mozilla.Thunderbird com.mattjakeman.ExtensionManager -y --noninteractive && \
    rpm-ostree cleanup -m && \
    ostree container commit 

### LINTING
## Verify final image and contents are correct.
RUN bootc container lint
