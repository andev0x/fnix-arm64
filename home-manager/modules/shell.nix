
# /home-manager/modules/shell.nix
# Configures the user's shell (Zsh with Oh My Zsh).

{ pkgs, ... }:

{
  programs.zsh = {
    enable = true;
    enableAutosuggestions = true;
    enableCompletion = true;
    syntaxHighlighting.enable = true;

    oh-my-zsh = {
      enable = true;
      theme = "agnoster";
      plugins = [ "git" "sudo" ];
    };

    # Custom aliases
    shellAliases = {
      ll = "ls -l";
      la = "ls -la";
      update = "sudo nixos-rebuild switch --flake ~/fnix-arm64";
      gc = "nix-collect-garbage -d";
      v = "nvim";
      vi = "nvim";
      vim = "nvim";
    };
  };

  # Install Neovim
  home.packages = with pkgs; [
    neovim
  ];
}
