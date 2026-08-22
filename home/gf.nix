{ pkgs, ... }:

{
  home.packages = [ (pkgs.callPackage ./pkgs/gf.nix { }) ];

  xdg.configFile."gf2_config.ini".text = ''
    [ui]
    scale=1.5
    font_size_interface=17
    font_size_code=20
    font_path=${pkgs.ioskeley-mono.semiCondensed-term-NF}/share/fonts/truetype/IoskeleyMonoTermNerdFont-SemiCondensed.ttf

    [vim]
    server_name=NONE
  '';
}
