FROM ubuntu:16.04
LABEL maintainer "timiil <timiil@163.com>"

ADD install.sh  /mnt/install.sh
ADD chr.sh  /chr.sh

RUN  apt-get update -y && apt-get upgrade -y && apt-get install -y qemu qemu-user-static binfmt-support debootstrap && \
     wget -c http://cdimage.ubuntu.com/ubuntu-base/releases/16.04.1/release/ubuntu-base-16.04.1-base-arm64.tar.gz && \
     tar -xzvf ubuntu-base-16.04.1-base-arm64.tar.gz -C /mnt/ && \
     cp -a /usr/bin/qemu-aarch64-static /mnt/usr/bin/ && \
     chmod +x /mnt/install.sh && \
     chmod +x /chr.sh
 
RUN  sh /chr.sh
#RUN  chroot /mnt/ /install.sh

