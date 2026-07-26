{
  pkgs,
  ...
}:

{
  imports = [
    ./disk.nix
    ./hardware-configuration.nix
    ./hyprland.nix
    ./nvidia.nix
  ];

  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  nix.settings.experimental-features = [
    "nix-command"
    "flakes"
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
    nerd-fonts.iosevka
    nerd-fonts.jetbrains-mono
    ioskeley-mono.normal-NF
  ];

  programs.zsh.enable = true;

  services.openssh.enable = true;
  system.stateVersion = "26.05";

}
