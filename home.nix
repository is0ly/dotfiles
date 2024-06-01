{ config, pkgs, ... }: {
  # TODO please change the username & home directory to your own
  home.username = "ilia";
  home.homeDirectory = "/home/ilia";

  gtk = {
    enable = true;
    iconTheme.name = "Tokyonight-Dark";
    font.name = "JetBrainsMono Nerd Font 10";
    theme = {
      package = pkgs.tokyonight-gtk-theme;
      name = "Tokyonight-Storm-BL-LB";
    };
  };

  # Packages that should be installed to the user profile.
  home.packages = with pkgs; [
    # here is some command line tools I use frequently
    # feel free to add your own or remove some of them

    # linux tools
    ripgrep
    fd
    fzf
    lazygit
    bat
    dua
    zellij
    httpie
    xplr
    fastfetch

    # wm
    rofi-wayland
    dunst

    # messangers
    telegram-desktop

    # browsers
    firefox

    # fonts
    noto-fonts
    noto-fonts-cjk
    noto-fonts-emoji
    noto-fonts-color-emoji
    liberation_ttf
    dina-font
    (nerdfonts.override { fonts = [ "JetBrainsMono" "Iosevka" ]; })
  ];

  fonts.fontconfig.enable = true;

  # basic configuration of git, please change to your own
  programs.git = {
    enable = true;
    userName = "is0ly";
    userEmail = "iljaosipov@gmail.com";
  };

  # programs.nushell = { enable = true; };

  # This value determines the home Manager release that your
  # configuration is compatible with. This helps avoid breakage
  # when a new home Manager release introduces backwards
  # incompatible changes.
  #
  # You can update home Manager without changing this value. See
  # the home Manager release notes for a list of state version
  # changes in each release.
  home.stateVersion = "24.05";

  # Let home Manager install and manage itself.
  programs.home-manager.enable = true;

  imports = [ ./emacs.nix ./hypr.nix ./kitty.nix ./helix.nix ];
}
