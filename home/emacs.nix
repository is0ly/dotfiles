{ pkgs, ... }:

{
  programs.doom-emacs = {
    enable = true;
    doomDir = ./doom;

    # pgtk build — native Wayland backend; transparency and rendering
    # behave correctly under niri with it.
    emacs = pkgs.emacs30-pgtk;

    # Tree-sitter grammars for Zig and other enabled languages.
    extraPackages = epkgs: [
      epkgs.treesit-grammars.with-all-grammars
    ];
  };

  # Emacs daemon: stays in the background, windows open instantly via
  # emacsclient. Without it Doom's startup is noticeably slow.
  services.emacs = {
    enable = true;
    client.enable = true;
    defaultEditor = false; # keep nvim as the default; Emacs on demand
  };
}
