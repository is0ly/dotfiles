{ ... }:

{
  programs.noctalia = {
    enable = true;

    # Niri starts Noctalia with the graphical session.
    systemd.enable = false;
  };
}
