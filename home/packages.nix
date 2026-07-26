{ pkgs, ... }:

{
  home.packages = with pkgs; [
    git
    lsd
    bat
    fastfetch
    nixfmt
    just
  ];
}
