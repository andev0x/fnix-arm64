
# /nixos/modules/desktop.nix
# Configures the graphical environment and display manager.

{ config, pkgs, ... }:

{
  # Enable the X server and Wayland support.
  services.xserver.enable = true;

  # Enable Hyprland Window Manager.
  programs.hyprland.enable = true;

  # Enable XDG portals for screen sharing, file pickers, etc. in Wayland.
  xdg.portal = {
    enable = true;
    extraPortals = [ pkgs.xdg-desktop-portal-gtk ];
  };

  # Use Greetd as a lightweight and themeable display manager.
  services.greetd = {
    enable = true;
    settings = {
      default_session = {
        command = "${pkgs.greetd.regreet}/bin/regreet --command Hyprland";
        user = "greeter";
      };
    };
  };

  # Environment variables required for Wayland sessions.
  environment.sessionVariables = {
    NIXOS_OZONE_WL = "1"; # For Electron apps
    WLR_NO_HARDWARE_CURSORS = "1";
  };
}
