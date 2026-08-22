{ ... }:

{
  imports = [
    ./packages.nix
    ./zsh.nix
    ./git.nix
    ./foot.nix
    ./niri.nix
    ./noctalia.nix
    ./direnv.nix
    ./zoxide.nix
    ./modules/yandex-browser.nix
    ./obs.nix
    ./emacs.nix
    ./gf.nix
  ];

  home = {
    username = "ilia";
    homeDirectory = "/home/ilia";
    stateVersion = "26.05";
  };

  programs.home-manager.enable = true;
}
