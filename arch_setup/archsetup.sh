#!/usr/bin/bash

# Ask for password
password=""
prompt="[SUDO] Enter your password: "
while IFS= read -p "$prompt" -r -s -n 1 letter; do
  if [[ $letter == $'\0' ]]; then
    break
  fi
  password="$password$letter"
  prompt="*"
done

# Little helper to reduce boilerplate
sudo_helper () {
  echo "$password" | sudo -S $1
}

# Set up Pacman config
echo -e "Setting up pacman"
pacman_settings=(
  "Color"
  "CheckSpace"
  "VerbosePkgLists"
  "ParallelDownloads"
)

# Uncomment settings if not already done
for line in "${pacman_settings[@]}"; do
  sudo_helper "sed -i "/$line/s/^#//g" /etc/pacman.conf"
done

# Enable "I love candy" mode
if ! grep -q "^ILoveCandy" /etc/pacman.conf; then
  sudo_helper "sed -i "/^ParallelDownloads/a ILoveCandy" /etc/pacman.conf"
fi

# Set up the chaotic AUR

if ! grep -q "^\[chaotic-aur\]" /etc/pacman.conf; then
  echo 'Setting up the Chaotic AUR'
  sudo_helper "pacman-key --recv-key 3056513887B78AEB --keyserver keyserver.ubuntu.com"
  sudo_helper "pacman-key --lsign-key 3056513887B78AEB"
  sudo_helper "pacman -U 'https://cdn-mirror.chaotic.cx/chaotic-aur/chaotic-keyring.pkg.tar.zst' --noconfirm"
  sudo_helper "pacman -U 'https://cdn-mirror.chaotic.cx/chaotic-aur/chaotic-mirrorlist.pkg.tar.zst' --noconfirm"
  sudo_helper "echo "[chaotic-aur]" >> /etc/pacman.conf"
  sudo_helper "echo "Include = /etc/pacman.d/chaotic-mirrorlist" >> /etc/pacman.conf"
fi

# Update pacman config
sudo_helper "pacman -Sy --noconfirm"

# Set up Paru if not already installed
if ! command -v paru; then
  echo 'Installing Paru'
  sudo_helper "pacman -S paru --noconfirm"
fi

# Set Paru to have a reverse order
sudo_helper "sed -i "/BottomUp/s/^#//g" /etc/paru.conf"

# Update full system
paru --noconfirm

