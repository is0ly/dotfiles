{
  niriPackage,
  pkgs,
  ...
}:

{
  programs.niri = {
    enable = true;
    package = niriPackage;
    useNautilus = false;
  };

  # Niri starts xwayland-satellite on demand when an X11 client connects.
  environment.systemPackages = [ pkgs.xwayland-satellite ];
}
