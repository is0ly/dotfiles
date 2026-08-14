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
    pkg-config
    sdl3
    llvm
    gcc
    gdb
    python3

    logiops

    zls
    nixd
    clojure-lsp
    clojure
    sbcl
    clang-tools
    emacsPackages.treesit-grammars.with-all-grammars

    vim
  ];
}
