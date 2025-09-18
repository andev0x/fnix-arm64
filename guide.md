# fnix-arm64 Guide

This guide will walk you through setting up your NixOS system using the `fnix-arm64` configuration.

## Prerequisites

- A machine with an ARM64 (aarch64) processor.
- NixOS installed. If you haven't installed it yet, you can follow the [official NixOS installation guide](https://nixos.org/download.html).

## Installation

1.  **Clone the repository:**

    ```bash
    git clone https://github.com/andev0x/fnix-arm64.git
    cd fnix-arm64
    ```

2.  **Change the username:**

    This configuration is set up for a user named `andev`. You must change this to your own username in two files:

    -   `nixos/configuration.nix`:

        ```nix
        # ...
        users.users.your-username = {
          isNormalUser = true;
          description = "Main User";
          extraGroups = [ "networkmanager" "wheel" ];
          shell = pkgs.zsh;
        };

        home-manager = {
          extraSpecialArgs = { inherit inputs; };
          users = {
            "your-username" = import ../home-manager/home.nix;
          };
        };
        # ...
        ```

    -   `home-manager/home.nix`:

        ```nix
        # ...
        home.homeDirectory = "/home/your-username";
        home.username = "your-username";
        # ...
        ```

3.  **Build and apply the configuration:**

    Use the `nixos-rebuild` command to apply the configuration to your system.

    ```bash
    sudo nixos-rebuild switch --flake .#fnix-arm64
    ```

    The system will now build and switch to the new configuration.

## Project Structure

-   `flake.nix`: The main entry point for the Nix configuration. It defines the dependencies and the final configurations.
-   `nixos/`: Contains the system-level configuration.
    -   `configuration.nix`: The main system configuration file.
    -   `modules/`: Contains modules for different system components like the desktop environment and system settings.
-   `home-manager/`: Contains the user-level configuration (dotfiles).
    -   `home.nix`: The main Home Manager configuration file.
    -   `modules/`: Contains modules for different user applications like hyprland, kitty, and waybar.
