#!/usr/bin/bash

# Dotfiles
# git clone https://github.com/NghiaHaNgoc/dotfiles.git /root/dotfiles

# Date time
echo -e "\033[1;44m SETUP DATETIME \033[0m"
ln -sf /usr/share/zoneinfo/Asia/Ho_Chi_Minh /etc/localtime
hwclock --systohc

# Language
echo -e "\033[1;44m SETUP LANGUAGE \033[0m"
sed -i '/^#en_US.UTF-8 UTF-8/s/^#//' /etc/locale.gen
locale-gen
echo LANG=en_US.UTF-8 > /etc/locale.conf
export LANG=en_US.UTF-8

# Network
echo -e "\033[1;44m SETUP NETWORK \033[0m"
echo "archlinux" > /etc/hostname
echo "127.0.0.1	localhost
::1		localhost
127.0.1.1	archlinux" > /etc/hosts
echo '
[main]
dns=none' >> /etc/NetworkManager/NetworkManager.conf
echo '
nameserver 1.1.1.1
nameserver 8.8.8.8
nameserver 2606:4700:4700::1111
nameserver 2001:4860:4860::8888
' > /etc/resolv.conf

# Pacman
echo -e "\033[1;44m SETUP PACKAGE MANAGER \033[0m"
sed -i '/#Color/a ILoveCandy' /etc/pacman.conf
sed -i '/^#Color/s/^#//g' /etc/pacman.conf
sed -i '/^#ParallelDownloads/s/^#//g' /etc/pacman.conf

# # Chaotic AUR
pacman-key --recv-key 3056513887B78AEB --keyserver keyserver.ubuntu.com
pacman-key --lsign-key 3056513887B78AEB
pacman -U --noconfirm 'https://cdn-mirror.chaotic.cx/chaotic-aur/chaotic-keyring.pkg.tar.zst'
pacman -U --noconfirm 'https://cdn-mirror.chaotic.cx/chaotic-aur/chaotic-mirrorlist.pkg.tar.zst'
echo '
[chaotic-aur]
Include = /etc/pacman.d/chaotic-mirrorlist' >> /etc/pacman.conf

# Grub
echo -e "\033[1;44m INSTALL GRUB \033[0m"
pacman -S --noconfirm grub efibootmgr os-prober
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
echo -e "\033[1;44m INSTALL GNOME PACKAGE \033[0m"
pacman -S --noconfirm gnome-shell gdm gnome-control-center \
	gnome-remote-desktop xdg-user-dirs-gtk \
	gnome-system-monitor nautilus gnome-shell-extensions \
	chromium kitty file-roller libreoffice-still \
	lua-language-server rustup go gopls code docker nodejs npm \
	ripgrep python-nautilus starship fish wl-clipboard ibus-unikey \
	noto-fonts noto-fonts-cjk noto-fonts-emoji ttf-jetbrains-mono ttf-nerd-fonts-symbols
# echo -e "\033[1;44m INSTALl NECESSARY PACKAGE \033[0m"
# echo -e "\033[1;44m REMOVE UNUSED GNOME PACKAGE \033[0m"
# pacman -Rsn --noconfirm \
# 	epiphany evince gnome-backgrounds gnome-calculator gnome-calendar \
# 	gnome-characters gnome-clocks gnome-connections gnome-console \
# 	gnome-contacts gnome-disk-utility gnome-font-viewer \
# 	gnome-logs gnome-maps gnome-menus gnome-music gnome-software gnome-text-editor \
# 	gnome-tour gnome-user-docs gnome-user-share gnome-weather \
# 	grilo-plugins gvfs-afc gvfs-dnssd gvfs-goa gvfs-google gvfs-gphoto2 \
# 	gvfs-mtp gvfs-nfs gvfs-onedrive gvfs-smb gvfs-wsdd \
# 	malcontent orca rygel simple-scan snapshot sushi tracker3-miners yelp totem

# User
echo -e "\033[1;44m USER SETUP \033[0m"
echo -e "\033[1;32m Enter root password \033[0m"
passwd
useradd -m nghiaha
echo -e "\033[1;32m Enter nghiaha password \033[0m"
passwd nghiaha
usermod -aG wheel nghiaha
chsh -s /usr/bin/fish nghiaha
EDITOR=nvim visudo
usermod -aG docker nghiaha

# Service
echo -e "\033[1;44m ENABLE SERVICE \033[0m"
systemctl enable docker.service
systemctl enable gdm.service
systemctl enable NetworkManager.service

# Clean up
rm -r /root/dotfiles
