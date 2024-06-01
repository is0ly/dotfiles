{ config, lib, pkgs, ... }:

{
  imports = [ ./hardware-configuration.nix ];

  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  boot.kernelPackages = pkgs.linuxPackages_latest;

  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  nix.package = pkgs.nixVersions.git;

  networking.networkmanager.enable = true;
  networking.networkmanager.wifi.powersave = false;

  time.timeZone = "Europe/Moscow";

  i18n.defaultLocale = "en_US.UTF-8";

  users.users.ilia = {
    isNormalUser = true;
    description = "ilia";
    extraGroups = [ "wheel" "networkmanager" ];
    shell = pkgs.nushell;
    packages = with pkgs; [ ];
  };

  environment.systemPackages = with pkgs; [ curl git ];

  services.openssh.enable = true;

  networking.hostName = "spotniz";
  system.stateVersion = "24.05";
}

