{ pkgs, ... }:

{
  home.packages = with pkgs; [
    git
    lsd
    bat
    fastfetch
    nixfmt
    just

    vlc

    firefox
    google-chrome
   
    telegram-desktop

    spotify

    qbittorrent

    lazygit

    yazi

    zip
    xz
    unzip
    p7zip

    #utils
    ripgrep
    jq
    yq-go
    fzf
    fd
    zellij
    zoxide

    ponysay
    tree
    cbonsai

    glow

    dust

    btop

    babashka
    python3

    logiops

    zls
    nixd
    clojure-lsp
    clojure
    sbcl
    clang-tools
    emacsPackages.treesit-grammars.with-all-grammars
    gdb
    (callPackage ./pkgs/gf.nix {})

    vim
  ];
}
