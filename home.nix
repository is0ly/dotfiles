{ config, pkgs, ... }: {
  # TODO please change the username & home directory to your own
  home.username = "ilia";
  home.homeDirectory = "/home/ilia";

  # Packages that should be installed to the user profile.
  home.packages = with pkgs; [
    # here is some command line tools I use frequently
    # feel free to add your own or remove some of them

    # Ricing
    swww
    neofetch
    rofi-wayland
    dunst
    wl-clipboard
    cliphist
    starship

    # archives
    zip
    xz
    unzip
    p7zip

    # utils
    ripgrep # recursively searches directories for a regex pattern
    jq # A lightweight and flexible command-line JSON processor
    yq-go # yaml processer https://github.com/mikefarah/yq
    eza # A modern replacement for ‘ls’
    fzf # A command-line fuzzy finder
    lsd # LSDeluxe
    lazygit # Terminal UI for Git
    bat
    fd
    nh
    zellij
    xplr
    babashka
    emacs
    neovim
    xray
    proxychains
    hyperfine

    #lsp
    #clojure-lsp

    # networking tools
    mtr # A network diagnostic tool
    iperf3
    dnsutils # `dig` + `nslookup`
    ldns # replacement of `dig`, it provide the command `drill`
    aria2 # A lightweight multi-protocol & multi-source command-line download utility
    socat # replacement of openbsd-netcat
    nmap # A utility for network discovery and security auditing
    ipcalc # it is a calculator for the IPv4/v6 addresses

    # misc
    ponysay
    cowsay
    file
    which
    tree
    gnused
    gnutar
    gawk
    zstd
    gnupg
    cbonsai

    # nix related
    #
    # it provides the command `nom` works just like `nix`
    # with more details log output
    nix-output-monitor

    # productivity

    glow # markdown previewer in terminal

    btop # replacement of htop/nmon
    iotop # io monitoring
    iftop # network monitoring

    # system call monitoring
    strace # system call monitoring
    ltrace # library call monitoring
    lsof # list open files

    # system tools
    sysstat
    lm_sensors # for `sensors` command
    ethtool
    pciutils # lspci
    usbutils # lsusb

    # web browsers
    google-chrome
    firefox

    # messengers
    telegram-desktop

    # audio
    pavucontrol

    # video
    vlc

    # fonts
    noto-fonts
    noto-fonts-cjk-sans
    noto-fonts-emoji
    noto-fonts-color-emoji
    liberation_ttf
    dina-font
    nerd-fonts.fira-code
    nerd-fonts.iosevka
    nerd-fonts.jetbrains-mono

    # programming languages
    racket
    #clang
    #clang-tools

    #torrent
    qbittorrent
  ];

  fonts.fontconfig.enable = true;

  # basic configuration of git, please change to your own
  programs.git = {
    enable = true;
    userName = "is0ly";
    userEmail = "iljaosipov@gmail.com";
  };

  #programs.nushell = { enable = true; };
  #
  #programs.zsh = { enable = true; };
  # Включение Zsh
  programs.zsh = {
    enable = true;
    enableCompletion = true;
    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;

    # Настройка Zap
    initContent = ''
      # Установка Zap, если он ещё не установлен
      if [[ ! -f ~/.zap/zap.zsh ]]; then
        mkdir -p ~/.zap
        git clone --depth 1 https://github.com/zap-zsh/zap.git ~/.zap
      fi
      source ~/.zap/zap.zsh

      # Декларативное подключение плагинов через Zap
      plug "zap-zsh/zap"
      #plug "zap-zsh/users"
      #plug "zap-zsh/exa"
      plug "wintermi/zsh-starship"
      plug "zsh-users/zsh-syntax-highlighting"
      plug "zsh-users/zsh-autosuggestions"

      eval "$(starship init zsh)"

      export PATH="$HOME/.local/bin:$PATH"
    '';

    # Опционально: кастомные алиасы или настройки
    shellAliases = {
      ll = "lsd -la";
      update = "sudo nixos-rebuild switch --flake .";
      garbage = "sudo nix-collect-garbage -d";
      get-rust =
        "nix flake init --template github:is0ly/rust-dev#default --refresh";
    };
  };

  # This value determines the home Manager release that your
  # configuration is compatible with. This helps avoid breakage
  # when a new home Manager release introduces backwards
  # incompatible changes.
  #
  # You can update home Manager without changing this value. See
  # the home Manager release notes for a list of state version
  # changes in each release.
  home.stateVersion = "24.11";

  # Let home Manager install and manage itself.
  programs.home-manager.enable = true;

  imports = [ ./ghostty.nix ./hypr.nix ./starship.nix ./helix.nix ./kitty.nix ];
}

