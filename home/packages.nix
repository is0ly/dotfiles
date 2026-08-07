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
    brave

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

    logiops

  ];
}
