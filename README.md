fnix-arm64
A complete, elegant, and minimalistic NixOS configuration for ARM64 VMs (Apple Silicon), featuring Hyprland.

This configuration is built with a modular approach, separating system and user settings for easy management and customization.

!(https://www.google.com/search?q=https://raw.githubusercontent.com/JaKooLit/Hyprland-v3/main/screenshots/screenshot1.png)

Philosophy
Simple & Clean: A minimal set of applications and a clean user interface.

Logical: A well-organized and easy-to-understand file structure.

Productive: Flexible window management and essential development tools pre-installed.

Beautiful: Aesthetically pleasing with a consistent theme (Catppuccin), fonts, and icons.

Features
OS: NixOS

Architecture: aarch64-linux

Window Manager: Hyprland (Wayland)

Terminal: Kitty

Bar: Waybar

App Launcher: Wofi

Shell: Zsh with Oh My Zsh

Theme & Icons: Catppuccin Mocha, Papirus Icons

Development Tools: GCC, Go, Python, Node.js, Zig

Structure
The configuration is split into two main parts:

/nixos: System-level configuration.

configuration.nix: Main entry point, pulls everything together.

/modules: System modules like hardware, networking, and services.

/home-manager: User-level configuration (dotfiles).

home.nix: User entry point.

/modules: User-specific modules for applications like Hyprland, Waybar, Kitty, etc.

Installation
Install NixOS: Start with a minimal NixOS installation on your VMware Fusion ARM VM.

Enable Flakes: Enable Nix command and flakes feature.

# Edit this file as root
sudo nano /etc/nixos/configuration.nix

Add the following lines:

nix.settings.experimental-features = [ "nix-command" "flakes" ];

Rebuild the system:

sudo nixos-rebuild switch

Clone the Repository:

# Make sure git is installed: nix-shell -p git
git clone [https://github.com/andev0x/fnix-arm64.git](https://github.com/andev0x/fnix-arm64.git)
cd fnix-arm64

Customize User:
Before building, you might want to change the default username and home directory path in nixos/configuration.nix and home-manager/home.nix from andev to your preferred username.

Build the System:
Run the following command from the root of the repository:

# This will build and switch to the new configuration defined in the flake
sudo nixos-rebuild switch --flake .#fnix-arm64

Reboot:
After the build is successful, reboot the system. You should be greeted by a graphical login screen and your new Hyprland desktop!


