
# /flake.nix
# This is the main entry point for the NixOS configuration.
# It defines the dependencies (inputs) and the final configurations (outputs).

{
  description = "A complete NixOS configuration for ARM64 using Hyprland";

  inputs = {
    # Nix Packages collection
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";

    # Home Manager for managing user-level packages and dotfiles
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, home-manager, ... }@inputs: {
    # Define the NixOS configuration
    nixosConfigurations.fnix-arm64 = nixpkgs.lib.nixosSystem {
      # The target system architecture - optimized for ARM64
      system = "aarch64-linux";

      # Special arguments passed to the modules, making inputs accessible
      specialArgs = { inherit inputs; };

      # List of modules to import
      modules = [
        # Main system configuration file
        ./nixos/configuration.nix

        # Home Manager module for NixOS
        home-manager.nixosModules.home-manager
      ];
    };
  };
}
