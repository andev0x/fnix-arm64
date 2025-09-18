A complete, elegant, and minimalistic NixOS configuration for ARM64 VMs (Apple Silicon), featuring Hyprland.

This configuration is built with a modular approach, separating system and user settings for easy management and customization.

<!-- ![Screenshot](https://raw.githubusercontent.com/andev0x/fnix-arm64/main/screenshot.png) -->
<!---->
## Philosophy

- **Simple & Clean**: A minimal set of applications and a clean user interface.
- **Logical**: A well-organized and easy-to-understand file structure.
- **Productive**: Flexible window management and essential development tools pre-installed.
- **Beautiful**: Aesthetically pleasing with a consistent theme (Catppuccin), fonts, and icons.

## Features

- **OS**: NixOS
- **Architecture**: `aarch64-linux`
- **Window Manager**: Hyprland (Wayland)
- **Terminal**: Kitty
- **Bar**: Waybar
- **App Launcher**: Wofi
- **Shell**: Zsh with Oh My Zsh
- **Theme & Icons**: Catppuccin Mocha, Papirus Icons
- **Development Tools**: GCC, Go, Python, Node.js, Zig

## Structure

The configuration is split into two main parts:

- `/nixos`: System-level configuration.
  - `configuration.nix`: Main entry point, pulls everything together.
  - `/modules`: System modules like hardware, networking, and services.
- `/home-manager`: User-level configuration (dotfiles).
  - `home.nix`: User entry point.
  - `/modules`: User-specific modules for applications like Hyprland, Waybar, Kitty, etc.

## Prerequisites

Before you begin, ensure you have the following:

- A running ARM64 VM (e.g., using VMware Fusion on an Apple Silicon Mac).
- A minimal installation of NixOS on the VM.

## Installation

1.  **Enable Flakes**:
    Enable the Nix command and flakes feature.

    ```bash
    # Edit this file as root
    sudo nano /etc/nixos/configuration.nix
    ```

    Add the following lines:

    ```nix
    nix.settings.experimental-features = [ "nix-command" "flakes" ];
    ```

2.  **Rebuild the system**:

    ```bash
    sudo nixos-rebuild switch
    ```

3.  **Clone the Repository**:

    ```bash
    # Make sure git is installed: nix-shell -p git
    git clone https://github.com/andev0x/fnix-arm64.git
    cd fnix-arm64
    ```

4.  **Customize User**:
    Before building, you'll need to change the default username and home directory path.

    - In `nixos/configuration.nix`, change the username:
      ```nix
      users.users.andev = {
      ```
    - In `home-manager/home.nix`, change the home directory path:
      ```nix
      home.homeDirectory = "/home/andev";
      ```

5.  **Build the System**:
    Run the following command from the root of the repository:

    ```bash
    # This will build and switch to the new configuration defined in the flake
    sudo nixos-rebuild switch --flake .#fnix-arm64
    ```

6.  **Reboot**:
    After the build is successful, reboot the system. You should be greeted by a graphical login screen and your new Hyprland desktop!

## Keybindings

Here are some of the default keybindings for Hyprland:

| Keybinding          | Action                   |
| ------------------- | ------------------------ |
| `Super + Q`         | Close window             |
| `Super + M`         | Exit Hyprland            |
| `Super + E`         | Open file manager (Thunar) |
| `Super + T`         | Open terminal (Kitty)    |
| `Super + Space`     | Open app launcher (Wofi) |
| `Super + F`         | Toggle fullscreen        |
| `Super + H/J/K/L`   | Move focus left/down/up/right |
| `Super + Shift + H/J/K/L` | Move window left/down/up/right |
| `Super + 1-9`       | Switch to workspace 1-9  |
| `Super + Shift + 1-9` | Move window to workspace 1-9 |

## Contributing

Contributions are welcome! If you have any suggestions or improvements, feel free to open an issue or submit a pull request.

## License

This project is licensed under the [MIT License](LICENSE).


