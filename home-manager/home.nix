
# /home-manager/home.nix
# Main entry point for user-specific configurations (dotfiles).

{ config, pkgs, ... }:

{
  imports = [
    ./modules/shell.nix
    ./modules/theme.nix
    ./modules/kitty.nix
    ./modules/hyprland.nix
    ./modules/waybar.nix
  ];

  # Home Manager needs a state version.
  home.stateVersion = "23.11";

  # The home directory for the user.
  # IMPORTANT: Change this if your username is not 'andev'.
  home.homeDirectory = "/home/andev";

  # The username for the user.
  # IMPORTANT: Change this if your username is not 'andev'.
  home.username = "andev";

  # Install user-specific packages optimized for ARM64.
  home.packages = with pkgs; [
    # App launchers & utilities (ARM64 compatible)
    wofi
    mako # Notification daemon
    grim # For screenshots
    slurp # For selecting a region for screenshots
    wl-clipboard # Wayland clipboard tool
    swww # Wallpaper utility for Wayland

    # File manager (ensure thunar is available for user)
    thunar

    # System monitoring (ARM64 optimized)
    btop
    neofetch
    # Add additional ARM64-friendly monitoring tools
    iotop
    nethogs
  ];

  # Let Home Manager manage itself.
  programs.home-manager.enable = true;
}
