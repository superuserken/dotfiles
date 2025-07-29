#!/bin/bash

#Install flatpak --if-not-exists
#Remove applications --if-pre-installed via system package manager (dnf)

#........flatpak........
dnf install -y flatpak
flatpak remote-delete fedora --force || true
flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
sudo flatpak repair
flatpak update

#........internet........
flatpak install flathub com.brave.Browser
flatpak install flathub org.mozilla.firefox
flatpak install flathub org.mozilla.Thunderbird

#........critical data........
flatpak install flathub org.keepassxc.KeePassXC
flatpak install flathub md.obsidian.Obsidian
flatpak install flathub org.cryptomator.Cryptomator
flatpak install flathub org.freefilesync.FreeFileSync

#........media........
flatpak install flathub org.videolan.VLC
flatpak install flathub org.kde.kdenlive

#........data utilities........
flatpak install flathub org.bleachbit.BleachBit
flatpak install flathub com.github.qarmin.czkawka