{ ... }:

{
  imports = [
    ./packages.nix
    ./zsh.nix
    ./git.nix
    ./neovim.nix
    ./ghostty.nix
    ./fuzzel.nix
    ./hyprland.nix
  ];

  home.username = "ilia";
  home.homeDirectory = "/home/ilia";

  home.stateVersion = "26.05";

  programs.home-manager.enable = true;
}
