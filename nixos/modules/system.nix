
# /nixos/modules/system.nix
# This module handles core system-level settings.

{ config, pkgs, ... }:

{
  # Bootloader configuration for UEFI systems.
  boot.loader.grub.enable = true;
  boot.loader.grub.efiSupport = true;
  boot.loader.grub.device = "nodev";

  # Set your time zone.
  time.timeZone = "Asia/Ho_Chi_Minh";

  # Set system locale and language.
  i18n.defaultLocale = "en_US.UTF-8";

  # Configure networking.
  # NetworkManager is a good default for desktops and laptops.
  networking.networkmanager.enable = true;
  networking.hostName = "fnix"; # Define your hostname

  # Enable the firewall for basic security.
  networking.firewall.enable = true;

  # Enable sound with PipeWire.
  sound.enable = true;
  hardware.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    # 32-bit support not needed on pure ARM64 systems
    # alsa.support32Bit = true;
    pulse.enable = true;
  };

  # Enable printing support.
  services.printing.enable = true;

  # Enable VMware guest additions for better integration.
  # Note: Some features may be limited on ARM64 VMs
  virtualisation.vmware.guest.enable = true;

  # Nix settings for performance and features.
  nix.settings.auto-optimise-store = true;

  # Install essential system-wide packages.
  environment.systemPackages = with pkgs; [
    # System utilities
    git
    wget
    curl
    unzip

    # Development tools
    gcc
    go
    python3
    nodejs
    zig

    # Web Browser
    firefox
  ];
}
