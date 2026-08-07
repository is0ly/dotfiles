{ pkgs, ... }:

{
  programs.neovim = {
    enable = true;
    defaultEditor = true;
    viAlias = true;
    vimAlias = true;

    extraPackages = with pkgs; [
      curl
      fd
      gcc
      lazygit
      lua-language-server
      nixd
      ripgrep
      statix
      stylua
      tree-sitter
      unzip
      zig
      zls
    ];
  };

  xdg.configFile."nvim" = {
    source = ./nvim;
    recursive = true;
  };
}
