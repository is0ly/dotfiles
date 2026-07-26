{
  description = "Ilia's NixOS configuration";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-26.05";

    home-manager = {
      url = "github:nix-community/home-manager/release-26.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    disko = {
      url = "github:nix-community/disko";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs =
    {
      self,
      nixpkgs,
      home-manager,
      disko,
      ...
    }:
    let
      system = "x86_64-linux";
      pkgs = nixpkgs.legacyPackages.${system};

      installer = pkgs.writeShellApplication {
        name = "install-desktop";
        runtimeInputs = [
          pkgs.coreutils
          pkgs.gnugrep
          pkgs.mkpasswd
          pkgs.nixos-install-tools
          pkgs.pciutils
          pkgs.util-linux
          disko.packages.${system}.disko-install
        ];
        text = ''
          export NIXOS_INSTALL_FLAKE=${self.outPath}#desktop
        ''
        + builtins.readFile ./scripts/install-desktop.sh;
      };
    in
    {
      nixosConfigurations.desktop = nixpkgs.lib.nixosSystem {
        inherit system;

        modules = [
          disko.nixosModules.disko
          ./hosts/desktop/configuration.nix

          home-manager.nixosModules.home-manager

          {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
            home-manager.users.ilia = import ./home/default.nix;
          }
        ];
      };

      apps.${system}.install = {
        type = "app";
        program = "${installer}/bin/install-desktop";
      };
    };
}
