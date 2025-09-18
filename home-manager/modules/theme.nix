
# /home-manager/modules/theme.nix
# Manages fonts, icons, cursors, and GTK themes.

{ pkgs, ... }:

{
  # Install necessary fonts.
  home.packages = with pkgs; [
    noto-fonts
    noto-fonts-cjk
    noto-fonts-emoji
    font-awesome # For icons in Waybar
    (nerdfonts.override { fonts = [ "JetBrainsMono" ]; })
  ];

  # Configure GTK for a consistent look across applications.
  gtk = {
    enable = true;
    theme = {
      name = "Catppuccin-Mocha-Standard-Blue-dark";
      package = pkgs.catppuccin-gtk.override {
        accents = [ "blue" ];
        variants = [ "mocha" ];
      };
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
