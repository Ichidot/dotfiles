#!/bin/sh

USERNAME="isaac"

# create dirs
cd ~/
mkdir new/

# update repos
sudo pacman -Sy --noconfirm

# essentials
sudo pacman -S git tlp brightnessctl playerctl openresolv iwd dhcpcd nano --noconfirm

sudo systemctl enable iwd dhcpcd tlp

# utils
sudo pacman -S wget yt-dlp wl-clipboard mpv cmus man-db stow starship fastfetch impala unzip --noconfirm

# shells
sudo pacman -S fish dash --noconfirm
sudo usermod --shell /bin/fish $USERNAME
sudo rm /bin/sh
sudo ln -s /bin/dash /bin/sh

# vpn
sudo pacman -S wireguard-tools --noconfirm

sudo resolvconf -u

# apps
sudo pacman -S qutebrowser neovim kitty --noconfirm

# langs
sudo pacman -S nodejs npm python python-pip lua luajit rust --noconfirm

# aur helper
git clone https://aur.archlinux.org/paru-bin.git
cd ~/paru-bin
makepkg -si --skippgpcheck
cd ~/
rm -rf ~/paru-bin

# wm & de
sudo pacman -S ly --noconfirm
sudo pacman -S hyprland hyprpaper hyprpicker hypridle hyprlock seatd --noconfirm
sudo pacman -S waybar fuzzel python-pywal --noconfirm

sudo systemctl enable ly

# audio
### for some reason, --noconfirm flag has weird behaviour in pipewire packages,
### so im gonna use this crappy solution
yes | sudo pacman -S pipewire
yes | sudo pacman -S wireplumber
yes | sudo pacman -S pipewire-alsa
yes | sudo pacman -S pipewire-pulse
yes | sudo pacman -S pipewire-jack

# fonts
sudo pacman -S ttf-nerd-fonts-symbols ttf-nerd-fonts-symbols-mono --noconfirm
sudo pacman -S noto-fonts-emoji --noconfirm

cd ~/
rm -rf .bash*

# symlink dotfiles
cd ~/dotfiles/
stow .

sudo pacman -Syu --noconfirm

sudo reboot
