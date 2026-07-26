{ pkgs, ... }:

{
  home.packages = with pkgs; [
    waybar
    git
    lsd
    bat
    fastfetch
    nixfmt
    just
  ];
}
