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
    ./noctalia.nix
    ./direnv.nix
  ];

  home = {
    username = "ilia";
    homeDirectory = "/home/ilia";
    stateVersion = "26.05";
  };

  programs.home-manager.enable = true;
}
