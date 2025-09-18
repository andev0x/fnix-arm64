
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

  # Install user-specific packages.
  home.packages = with pkgs; [
    # App launchers & utilities
    wofi
    mako # Notification daemon
    grim # For screenshots
    slurp # For selecting a region for screenshots
    wl-clipboard # Wayland clipboard tool
    swaybg # Wallpaper utility

    # File manager
    thunar

    # System monitoring
    btop
    neofetch
  ];

  # Let Home Manager manage itself.
  programs.home-manager.enable = true;
}
