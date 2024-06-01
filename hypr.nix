# Hyprland nix

{ config, pkgs, lib, ... }:

{
  wayland.windowManager.hyprland = {
  enable = true;
  extraConfig = builtins.readFile ./hypr.conf;
  };
}
