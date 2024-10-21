#!/bin/bash

# Create the dotfiles directory if it doesn't exist
mkdir -p ~/.dotfiles/i3
mkdir -p ~/.dotfiles/i3status
mkdir -p ~/.dotfiles/dunst
mkdir -p ~/.dotfiles/xdg-desktop-portal
mkdir -p ~/.dotfiles/custom_files

# Move the configuration files to the dotfiles directory

echo "Moving configuration files to ~/.dotfiles directory..."

# Move i3 config
mv ~/.config/i3/config ~/.dotfiles/i3/config

# Move i3status config
mv ~/.config/i3status/config ~/.dotfiles/i3status/config

# Move bashrc
mv ~/.bashrc ~/.dotfiles/bashrc

# Move dunstrc
mv ~/.config/dunst/dunstrc ~/.dotfiles/dunst/dunstrc

# Move xdg-desktop-portal portals.conf
mv ~/.config/xdg-desktop-portal/portals.conf ~/.dotfiles/xdg-desktop-portal/portals.conf

# Move custom scripts in .config/custom_files
mv ~/.config/custom_files/* ~/.dotfiles/custom_files/

# Create symbolic links in the original locations

echo "Creating symlinks..."

# Symlink i3 config
ln -s ~/.dotfiles/i3/config ~/.config/i3/config

# Symlink i3status config
ln -s ~/.dotfiles/i3status/config ~/.config/i3status/config

# Symlink bashrc
ln -s ~/.dotfiles/bashrc ~/.bashrc

# Symlink dunstrc
ln -s ~/.dotfiles/dunst/dunstrc ~/.config/dunst/dunstrc

# Symlink portals.conf (xdg desktop portal)
ln -s ~/.dotfiles/xdg-desktop-portal/portals.conf ~/.config/xdg-desktop-portal/portals.conf

# Symlink custom scripts directory
ln -s ~/.dotfiles/custom_files ~/.config/custom_files

# Verify the symlinks
echo "Verifying symlinks..."

ls -l ~/.config/i3/config
ls -l ~/.config/i3status/config
ls -l ~/.bashrc
ls -l ~/.config/dunst/dunstrc
ls -l ~/.config/xdg-desktop-portal/portals.conf
ls -l ~/.config/custom_files

echo "Setup complete!"
