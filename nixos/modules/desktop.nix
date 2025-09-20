
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
        command = "${pkgs.regreet}/bin/regreet";
        user = "greeter";
      };
    };
  };

  # Create the greeter user with proper permissions
  users.users.greeter = {
    description = "Greeter user for greetd";
    group = "greeter";
    isSystemUser = true;
  };
  users.groups.greeter = {};

  # Add GTK dependencies for regreet
  environment.systemPackages = with pkgs; [
    regreet
    # GTK dependencies for regreet
    gtk4
    libadwaita
    # Additional GTK libraries that might be needed
    gsettings-desktop-schemas
    glib
    gdk-pixbuf
    pango
    atk
    cairo
    gtk3
  ];

  # Environment variables required for Wayland sessions.
  environment.sessionVariables = {
    NIXOS_OZONE_WL = "1"; # For Electron apps
    WLR_NO_HARDWARE_CURSORS = "1";
    # ARM64-specific optimizations
    MESA_GL_VERSION_OVERRIDE = "3.3";
    __GL_THREADED_OPTIMIZATIONS = "1";
    # Optimize for ARM64 graphics
    LIBGL_ALWAYS_SOFTWARE = "0";
    # File manager environment variables
    GVFS_DISABLE_FUSE = "1";
    # GTK environment variables for regreet
    GTK_THEME = "Adwaita:dark";
    XCURSOR_THEME = "Adwaita";
    XCURSOR_SIZE = "24";
  };

  # Create log directory for regreet with proper permissions
  systemd.tmpfiles.rules = [
    "d /var/log/regreet 0755 greeter greeter -"
  ];
}
