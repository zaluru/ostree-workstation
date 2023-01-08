FROM ghcr.io/zaluru/ostree-base:latest

RUN wget https://copr.fedorainfracloud.org/coprs/alebastr/river/repo/fedora-37/alebastr-river-fedora-37.repo -O /etc/yum.repos.d/alebastr-river.repo
RUN wget https://copr.fedorainfracloud.org/coprs/atim/leftwm/repo/fedora-37/atim-leftwm-fedora-37.repo -O /etc/yum.repos.d/atim-leftwm.repo

RUN rpm-ostree install river leftwm podman-docker \
    && rm -f /etc/yum.repos.d/alebastr-river.repo \
    && rm -f /etc/yum.repos.d/atim-leftwm.repo \
    # some packages add files to /var, I'm not sure what to do about it
    # this leads to an error in the ostree container commit, so I decided to print the contents of /var
    # to be able to see if anything important was placed there 
    && tree /var \
    # should probably find another way to fix it
    && rm -r /var/* \
    && ostree container commit