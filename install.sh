#!/bin/sh

mkdir -p /etc/network/interfaces.d/

echo $HOST > /etc/hostname
echo "127.0.0.1    localhost.localdomain localhost" > /etc/host
echo "127.0.0.1    $HOST" >> /etc/hosts
echo "auto eth0" > /etc/network/interfaces.d/eth0
echo "iface eth0 inet dhcp" >> /etc/network/interfaces.d/eth0
echo "nameserver 8.8.8.8" > /etc/resolv.conf
echo "nameserver 114.114.114.114" >> /etc/resolv.conf

apt-get update -y 
apt-get upgrade -y
apt-get install -y ifupdown net-tools network-manager udev sudo ssh nano
