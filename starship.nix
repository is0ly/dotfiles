{ config, pkgs, lib, ... }: {
  programs.starship = {
    enable = true;
    settings = pkgs.lib.importTOML ./starship.toml;
    #settings = {
    #add_newline = false;
    #aws.disabled = true;
    #gcloud.disabled = true;
    #line_break.disabled = true;
    #character = { success_symbol = "[❯](purple)"; };
    #};
  };
}

