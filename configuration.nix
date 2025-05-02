{ config, lib, pkgs, ... }:

{
  imports = [ ./hardware-configuration.nix ];

  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  boot.kernelPackages = pkgs.linuxPackages_latest;

  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  nix.package = pkgs.nixVersions.latest;

  nixpkgs.config.allowUnfree = true;

  networking.hostName = "spotniz";

  networking.networkmanager.enable = true;
  networking.networkmanager.wifi.powersave = false;

  time.timeZone = "Europe/Moscow";

  i18n.defaultLocale = "en_US.UTF-8";

  users.users.ilia = {
    isNormalUser = true;
    description = "ilia";
    extraGroups = [ "wheel" "networkmanager"];
    shell = pkgs.nushell;
    packages = with pkgs; [ ];
  };

  environment.systemPackages = with pkgs; [ git curl wget ];

  services.openssh.enable = true;

  system.stateVersion = "24.11"; # Did you read the comment?

}

