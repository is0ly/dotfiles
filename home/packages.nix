{ pkgs, ... }:

{
  home.packages = with pkgs; [
    foot
    wofi
    waybar
    git
    lsd
    bat
    fastfetch
    nixfmt
    just
  ];
}
