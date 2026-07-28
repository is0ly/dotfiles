{
  pkgs,
  ...
}:

{
  imports = [
    ./detected-hardware.nix
    ./disk.nix
    ./hardware-configuration.nix
    ./niri.nix
    ./nvidia.nix
  ];

  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  nix.settings.experimental-features = [
    "nix-command"
    "flakes"
  ];
  nix.settings.extra-substituters = [
    "https://noctalia.cachix.org"
  ];
  nix.settings.extra-trusted-public-keys = [
    "noctalia.cachix.org-1:pCOR47nnMEo5thcxNDtzWpOxNFQsBRglJzxWPp3dkU4="
  ];

  networking.hostName = "desktop";

  networking.networkmanager.enable = true;

  time.timeZone = "Europe/Moscow";

  users.users.ilia = {
    isNormalUser = true;
    extraGroups = [
      "wheel"
      "networkmanager"
    ];
    shell = pkgs.zsh;
  };

  security.polkit.enable = true;

  fonts.packages = with pkgs; [
    nerd-fonts.jetbrains-mono
    ioskeley-mono.semiCondensed-term-NF
  ];

  programs.zsh.enable = true;

  system.stateVersion = "26.05";
}
