{ config, pkgs, lib, ... }:

{
  programs.helix = {
    enable = true;
    settings = {
      #theme = "base16_transparent";
      theme = "tokyonight";
      editor.line-number = "relative";
      editor.cursor-shape = {
        normal = "block";
        insert = "bar";
        select = "underline";
      };
      editor.indent-guides = {
        render = true;
        character = "|";
      };
      editor.statusline = {
        left = [ "mode" "spinner" ];
        center = [ "file-name" ];
        right = [
          "version-control"
          "diagnostics"
          "selections"
          "position"
          "file-encoding"
          "file-line-ending"
          "file-type"
        ];
        separator = "│";
      };
    };
    languages.language = [
      {
        name = "nix";
        auto-format = true;
        formatter.command = "${pkgs.nixfmt-classic}/bin/nixfmt";
      }
      {
        name = "c";
        auto-format = true;
      }
    ];

    # themes = {
    #   base16_transparent = {
    #     "inherits" = "base16";
    #     "ui.background" = { };
    #   };
    # };
  };
}
