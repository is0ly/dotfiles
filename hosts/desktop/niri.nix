{ pkgs, ... }:

{
  programs.niri = {
    enable = true;
    useNautilus = false;
  };

  # Niri starts xwayland-satellite on demand when an X11 client connects.
  environment.systemPackages = [ pkgs.xwayland-satellite ];
}
