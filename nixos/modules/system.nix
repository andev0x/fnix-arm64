
# /nixos/modules/system.nix
# This module handles core system-level settings.

{ config, pkgs, ... }:

{
  # Bootloader configuration for UEFI systems.
  boot.loader.grub.enable = true;
  boot.loader.grub.efiSupport = true;
  boot.loader.grub.device = "nodev";

  # Basic filesystem configuration
  # Note: This is a minimal configuration - adjust for your actual setup
  fileSystems."/" = {
    device = "/dev/disk/by-label/nixos";
    fsType = "ext4";
  };

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
  # sound.enable = true; # Deprecated - removed
  hardware.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    # Explicitly disable 32-bit support for ARM64 systems
    alsa.support32Bit = false;
    pulse.enable = true;
  };

  # Enable printing support.
  services.printing.enable = true;

  # Basic file system services (without thunar)
  services.gvfs.enable = true; # GVFS for file system integration
  services.udisks2.enable = true; # Disk management

  # VMware guest additions - disabled for ARM64 as it has limited support
  # virtualisation.vmware.guest.enable = true;

  # Nix settings for performance and features.
  nix.settings.auto-optimise-store = true;
  
  # ARM64-specific optimizations
  nix.settings.experimental-features = [ "nix-command" "flakes" ];
  
  # Enable parallel building for ARM64 (adjust based on your CPU cores)
  nix.settings.max-jobs = "auto";
  
  # Enable binary cache for faster builds on ARM64
  nix.settings.substituters = [
    "https://cache.nixos.org/"
    "https://nix-community.cachix.org"
  ];
  nix.settings.trusted-public-keys = [
    "cache.nixos.org-1:6NCHdD59X431o0gWypbMrAURkbJ16ZPMQFGspcDShjY="
    "nix-community.cachix.org-1:mB9FSh9qf2dCimDSUo8Zy7bkq5CX+/rkCWyvRCYg3Fs="
  ];

  # Enable zsh program for system-wide use
  programs.zsh.enable = true;

  # Enable basic file utilities
  programs.file-roller.enable = true; # Archive manager

  # Install essential system-wide packages optimized for ARM64.
  environment.systemPackages = with pkgs; [
    # System utilities
    git
    wget
    curl
    unzip
    htop # Better alternative to top for ARM64
    tree

    # Development tools (ARM64 compatible)
    gcc
    go
    python3
    nodejs
    zig
    # Add rust for better ARM64 development support
    rustc
    cargo

    # File manager alternatives (lightweight and ARM64 compatible)
    pcmanfm # Lightweight file manager
    # Basic file system utilities
    desktop-file-utils # For desktop file integration
    shared-mime-info # For MIME type support

    # Web Browser (ARM64 compatible)
    firefox
    # Add chromium as alternative for better ARM64 support
    chromium
  ];
}
