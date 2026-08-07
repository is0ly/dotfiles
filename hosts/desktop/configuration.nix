{
  pkgs,
  config,
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
    ./modules/logiops.nix
  ];

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

  security.rtkit.enable = true;

  services = {
    pulseaudio.enable = false;

    pipewire = {
      enable = true;
      alsa.enable = true;
      alsa.support32Bit = true;
      pulse.enable = true;
      wireplumber.enable = true;
    };

    ollama = {
      enable = true;
      package = pkgs.ollama-cuda;
    };

  };

  nix.settings = {
    substituters = [ "https://cuda-maintainers.cachix.org" ];
    trusted-public-keys = [
      "cuda-maintainers.cachix.org-1:0dq3bujKpuEPMCX6U4WylrUDZ9JyUG0VpVZa7CNfq5E="
    ];
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
      "input"
      "uinput"
    ];
    shell = pkgs.zsh;
  };

  security.polkit.enable = true;

  services.hardware.openrgb = {
    enable = true;
    motherboard = "amd";
  };

  hardware = {
    bluetooth = {
      enable = true;
      powerOnBoot = true;
      settings.General.Experimental = true;
    };

    logitech.wireless = {
      enable = true;
      enableGraphical = true;
    };

    uinput.enable = true;
  };

  boot = {
    extraModulePackages = [ config.boot.kernelPackages.nct6687d ];
    kernelModules = [ "nct6687" ];
    blacklistedKernelModules = [ "nct6683" ];

    extraModprobeConfig = ''
      options nct6687 msi_fan_brute_force=1
    '';
  };

  programs.coolercontrol.enable = true;

  environment.systemPackages = with pkgs; [
    lm_sensors
  ];

  fonts.packages = with pkgs; [
    nerd-fonts.jetbrains-mono
    ioskeley-mono.semiCondensed-term-NF
    ioskeley-mono.semiCondensed-NF
  ];

  programs.zsh.enable = true;

  system.stateVersion = "26.05";
}
