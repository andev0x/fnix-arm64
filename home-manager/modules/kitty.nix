
# /home-manager/modules/kitty.nix
# Configures the Kitty terminal emulator.

{ ... }:

{
  programs.kitty = {
    enable = true;
    font = {
      name = "JetBrainsMono Nerd Font";
      size = 12;
    };
    theme = "Catppuccin-Mocha";
    settings = {
      background_opacity = "0.9";
      scrollback_lines = 10000;
    };
  };
}
