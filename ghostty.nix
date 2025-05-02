{ config, pkgs, lib, ... }:

{
  programs.ghostty = {
    enable = true;
    extraConfig = builtins.readFile ./config;
  };
}
