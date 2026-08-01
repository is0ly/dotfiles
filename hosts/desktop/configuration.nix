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
    ./steam.nix
    ./throne.nix
  ];

  #boot.loader.systemd-boot.enable = true;
  #boot.loader.efi.canTouchEfiVariables = true;
  #boot.kernelPackages = pkgs.linuxPackages_latest;

  boot = {
    loader = {
      systemd-boot.enable = true;
      efi.canTouchEfiVariables = true;
    };
    kernelPackages = pkgs.linuxPackages_latest;
  };

  nix.settings.experimental-features = [
    "nix-command"
    "flakes"
  ];

  networking.hostName = "desktop";

  networking.networkmanager.enable = true;

  services.pulseaudio.enable = false;

  security.rtkit.enable = true;

  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    wireplumber.enable = true;
  };

  time.timeZone = "Europe/Moscow";

  i18n.defaultLocale = "en_US.UTF-8";
  i18n.extraLocaleSettings = {
    LC_TIME = "ru_RU.UTF-8";
  };

  users.users.ilia = {
    isNormalUser = true;
    extraGroups = [
      "wheel"
      "networkmanager"
    ];
    shell = pkgs.zsh;
  };

  security.polkit.enable = true;

  hardware.bluetooth = {
    enable = true;
    powerOnBoot = true;
    settings.General.Experimental = true;
  };

  fonts.packages = with pkgs; [
    nerd-fonts.jetbrains-mono
    ioskeley-mono.semiCondensed-term-NF
    ioskeley-mono.semiCondensed-NF
  ];

  programs.zsh.enable = true;

  system.stateVersion = "26.05";
}
