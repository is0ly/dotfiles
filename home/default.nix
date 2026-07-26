{ ... }:

{
  imports = [
    ./packages.nix
    ./zsh.nix
    ./git.nix
    ./neovim.nix
    ./waybar.nix
    ./niri.nix
    ./foot.nix
  ];

  home.username = "ilia";
  home.homeDirectory = "/home/ilia";

  home.stateVersion = "26.05";

  programs.home-manager.enable = true;
}
