# Allow build scripts to be referenced without being copied into the final image
FROM scratch AS ctx
COPY build_files /

FROM quay.io/centos-bootc/centos-bootc:stream10

RUN --mount=type=tmpfs,dst=/opt \
    --mount=type=tmpfs,dst=/tmp \
    --mount=type=tmpfs,dst=/var \
    --mount=type=tmpfs,dst=/boot \
    --mount=type=bind,from=ctx,source=/,target=/ctx \
    /ctx/build.sh

# Makes `/opt` writeable by default
RUN rm -rf /opt && ln -s /var/opt /opt

### LINTING
## Verify final image and contents are correct.
# RUN bootc container lint
