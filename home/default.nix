{ ... }:

{
  imports = [
    ./packages.nix
    ./zsh.nix
    ./git.nix
    ./neovim.nix
    ./foot.nix
    ./fuzzel.nix
    ./niri.nix
  ];

  home.username = "ilia";
  home.homeDirectory = "/home/ilia";

  home.stateVersion = "26.05";

  programs.home-manager.enable = true;
}
