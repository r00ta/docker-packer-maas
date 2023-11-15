FROM ubuntu:jammy-20231004 

RUN apt-get update && apt-get install -y libnbd-bin nbdkit fuse2fs qemu qemu-system gettext-base fuse make curl unzip

RUN curl -o /tmp/tmp-packer.zip https://releases.hashicorp.com/packer/1.9.0/packer_1.9.0_linux_amd64.zip && \
    unzip /tmp/tmp-packer.zip -d /bin && rm /tmp/tmp-packer.zip

RUN /bin/packer plugins install "github.com/hashicorp/qemu"

RUN apt-get remove -y curl unzip

ENTRYPOINT ["make"]
