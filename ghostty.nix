{ config, pkgs, lib, ... }:

{
  programs.ghostty = {
    enable = true;
    settings = {
      font-family = "Iosevka Nerd Font";
      font-size = 14;
      theme = "GruvboxDark";
      background-opacity = 0.8;
    };
  };
}
