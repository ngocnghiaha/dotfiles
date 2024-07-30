#!/usr/bin/bash

ln -sf /usr/share/zoneinfo/Asia/Ho_Chi_Minh /etc/localtime
hwclock --systohc

# Language
sed -i '/^#en_US.UTF-8 UTF-8/s/^#//' /etc/locale.gen
locale-gen
echo LANG=en_US.UTF-8 > /etc/locale.conf
export LANG=en_US.UTF-8

# Dotfiles
# git clone https://github.com/NghiaHaNgoc/dotfiles.git /root/dotfiles

# Network
echo "archlinux" > /etc/hostname
echo "127.0.0.1	localhost
::1		localhost
127.0.1.1	archlinux" > /etc/hosts
echo '[main]
dns=none' >> /etc/NetworkManager/NetworkManager.conf
echo '
nameserver 1.1.1.1
nameserver 8.8.8.8
nameserver 2606:4700:4700::1111
nameserver 2001:4860:4860::8888
' > /etc/resolv.conf

# Pacman
sed '/#Color/a ILoveCandy' /etc/pacman.conf
sed -i '/^#Color/s/^#//g' /etc/pacman.conf
sed -i '/^#ParallelDownloads/s/^#//g' /etc/pacman.conf

# Grub
pacman -S grub efibootmgr os-prober
mkdir /boot/efi
mount /dev/nvme0n1p1 /boot/efi # WARN: select right partition
sed -i '/^#GRUB_DISABLE_OS_PROBER/s/^#//g' /etc/default/grub
sed -i '/^#GRUB_THEME/s/=.*/=\"\/boot\/grub\/themes\/arch\/theme.txt\"/g' /etc/default/grub
sed -i '/^#GRUB_THEME/s/^#//g' /etc/default/grub
grub-install --target=x86_64-efi --bootloader-id=arch --efi-directory=/boot/efi --recheck
mkdir -p /boot/grub/themes
cp -r /root/dotfiles/system/boot /
grub-mkconfig -o /boot/grub/grub.cfg

# Essential package
pacman -S gnome fish \
	chromium kitty file-roller libreoffice-fresh \
	rust rust-analyzer go gopls code docker nodejs npm \
	ripgrep python-nautilus starship \
	noto-fonts noto-fonts-cjk noto-fonts-emoji woff2-fira-code ttf-nerd-fonts-symbols
pacman -Rsn epiphany evince gnome-backgrounds gnome-calculator gnome-calendar \
	gnome-characters gnome-clocks gnome-connections gnome-console \
	gnome-contacts gnome-disk-utility gnome-font-viewer gnome-keyring \
	gnome-logs gnome-maps gnome-menus gnome-music gnome-software gnome-text-editor \
	gnome-tour gnome-user-docs gnome-user-share gnome-weather \
	grilo-plugins gvfs-afc gvfs-dnssd gvfs-goa gvfs-google gvfs-gphoto2 \
	gvfs-mtp gvfs-nfs gvfs-onedrive gvfs-smb gvfs-wsdd \
	malcontent orca rygel simple-scan snapshot sushi tracker3-miners yelp totem

# User
passwd
useradd -m nghiaha
passwd nghiaha
usermod -aG wheel nghiaha
chsh -s /usr/bin/fish nghiaha
EDITOR=nvim visudo

# Service
systemctl enable docker.service
systemctl enable gdm.service
systemctl enable NetworkManager.service

# Clean up
rm -r /root/dotfiles
