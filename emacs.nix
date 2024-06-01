{ cinfig, pkgs, lib, ... }: {
  programs.emacs = {
    enable = true;
    package =
      pkgs.emacs; # replace with pkgs.emacs-gtk, or a version provided by the community overlay if desired.
    extraConfig = builtins.readFile ./init.el;
  };
}
