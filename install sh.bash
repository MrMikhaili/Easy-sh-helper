#!/bin/bash
sudo -v
# Цикл для обновления прав sudo в фоне
while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &

echo "--- AUR HELPER INSTALLER ---"
echo "1) Install yay (Go based)"
echo "2) Install paru (Rust based)"
read -p "Select option [1-2]: " choice

case $choice in
    1)
        echo "Starting yay installation..."
        sudo pacman -S --needed --noconfirm base-devel git  && git clone https://aur.archlinux.org/yay-git.git && cd yay-git && makepkg -si --noconfirm
        ;;
    2)
        echo "Starting paru installation..."
        sudo pacman -S --needed --noconfirm base-devel git  && git clone https://aur.archlinux.org/paru-git.git && cd paru-git && makepkg -si --noconfirm
        ;;
    *)
        echo "Error: Invalid option."
        exit 1
        ;;
esac
