
# /home-manager/modules/theme.nix
# Manages fonts, icons, cursors, and GTK themes.

{ pkgs, ... }:

{
  # Install necessary fonts.
  home.packages = with pkgs; [
    noto-fonts
    noto-fonts-cjk-sans
    noto-fonts-emoji
    font-awesome # For icons in Waybar
    nerd-fonts.jetbrains-mono # Individual nerd font package
  ];

  # Configure GTK for a consistent look across applications.
  gtk = {
    enable = true;
    theme = {
      name = "Catppuccin-Mocha-Dark";
      package = pkgs.catppuccin-gtk;
    };
    iconTheme = {
      name = "Papirus-Dark";
      package = pkgs.papirus-icon-theme;
    };
    cursorTheme = {
      name = "Catppuccin-Mocha-Dark";
      package = pkgs.catppuccin-cursors.mochaDark;
    };
  };
}
