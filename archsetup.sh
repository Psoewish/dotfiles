#!/usr/bin/bash

# Set up Pacman config
echo -e "Setting up pacman"
#pacman_conf="/etc/pacman.conf"
pacman_settings=(
  "Color"
  "CheckSpace"
  "VerbosePkgLists"
  "ParallelDownloads"
)

# Uncomment settings if not already done
for line in "${pacman_settings[@]}"; do
    sudo sed -i "/$line/s/^#//g" /etc/pacman.conf
done

# Enable "I love candy" mode
if ! grep -q "^ILoveCandy" /etc/pacman.conf; then
  sudo sed -i "/^ParallelDownloads/a ILoveCandy" /etc/pacman.conf
fi

# Set up the chaotic AUR
echo 'Setting up the Chaotic AUR'
sudo pacman-key --recv-key 3056513887B78AEB --keyserver keyserver.ubuntu.com
sudo pacman-key --lsign-key 3056513887B78AEB
sudo pacman -U 'https://cdn-mirror.chaotic.cx/chaotic-aur/chaotic-keyring.pkg.tar.zst'
sudo pacman -U 'https://cdn-mirror.chaotic.cx/chaotic-aur/chaotic-mirrorlist.pkg.tar.zst'
sudo echo "[chaotic-aur]" >> /etc/pacman.conf
sudo echo "Include = /etc/pacman.d/chaotic-mirrorlist" >> /etc/pacman.conf

# Update pacman config
sudo pacman -Sy

# Set up Paru
echo 'Installing Paru'
sudo pacman -S paru --noconfirm

# Update full system
paru --noconfirm

