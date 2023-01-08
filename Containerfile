FROM ghcr.io/zaluru/ostree-base:latest

RUN wget https://copr.fedorainfracloud.org/coprs/alebastr/river/repo/fedora-37/alebastr-river-fedora-37.repo -O /etc/yum.repos.d/alebastr-river.repo
RUN wget https://copr.fedorainfracloud.org/coprs/atim/leftwm/repo/fedora-37/atim-leftwm-fedora-37.repo -O /etc/yum.repos.d/atim-leftwm.repo

RUN river leftwm podman-docker \
    && rm -f /etc/yum.repos.d/alebastr-river.repo \
    && rm -f /etc/yum.repos.d/atim-leftwm.repo \
    && ostree container commit