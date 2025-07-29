#!/bin/bash

hostnamectl set-hostname ken

#........system........
sudo echo "max_parallel_downloads=10" | tee -a /etc/dnf/dnf.conf > /dev/null
sudo dnf up

dnf install -y https://download1.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm
dnf install -y https://download1.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm
dnf group update core -y

#dnf swap mesa-va-drivers mesa-va-drivers-freeworld -y && dnf swap mesa-vdpau-drivers mesa-vdpau-drivers-freeworld -y
#dnf -y install intel-media-driver
#fwupdmgr refresh --force && fwupdmgr get-updates && fwupdmgr update -y

sudo dnf install -y @virtualization
sudo dnf install -y openssh-server && sudo systemctl enable --now sshd

#........development environment........
dnf install git

rpmkeys --import https://gitlab.com/paulcarroty/vscodium-deb-rpm-repo/-/raw/master/pub.gpg
printf "[gitlab.com_paulcarroty_vscodium_repo]
name=download.vscodium.com
baseurl=https://download.vscodium.com/rpms/
enabled=1
gpgcheck=1
repo_gpgcheck=1
gpgkey=https://gitlab.com/paulcarroty/vscodium-deb-rpm-repo/-/raw/master/pub.gpg
metadata_expire=1h" | sudo tee -a /etc/yum.repos.d/vscodium.repo
dnf install -y codium

#........additional utilities........
dnf install -y mc btop htop rsync inxi ncdu tilix tmux fastfetch unzip unrar wget curl syncthing gparted qrencode

sudo dnf autoremove -y
sudo dnf clean all