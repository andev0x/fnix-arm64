
# /nixos/configuration.nix
# This is the main system configuration file. It imports other modules
# and sets up the primary user account with Home Manager.

{ config, pkgs, inputs, ... }:

{
  imports = [
    ./modules/system.nix
    ./modules/desktop.nix
  ];

  # Allow proprietary software.
  nixpkgs.config.allowUnfree = true;

  # Define the main user account.
  # IMPORTANT: Change 'andev' to your desired username.
  users.users.andev = {
    isNormalUser = true;
    description = "Main User";
    extraGroups = [ "networkmanager" "wheel" ]; # 'wheel' for sudo access
    shell = pkgs.zsh;
  };

  # Configure Home Manager for the main user.
  home-manager = {
    extraSpecialArgs = { inherit inputs; };
    users = {
      # IMPORTANT: Ensure this username matches the one above.
      "andev" = import ../home-manager/home.nix;
    };
  };

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "23.11"; # Did you read the comment?
}
