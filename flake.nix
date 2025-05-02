{
  description = "NixOS config";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    hyprland = {
      url = "github:hyprwm/Hyprland";
      inputs.nixpkgs.follows = "nixpkgs"; # MESA/OpenGL HW workaround
    };
  };

  outputs = { self, nixpkgs, home-manager, hyprland, ... }@inputs: {
    # Please replace my-nixos with your hostname
    nixosConfigurations.spotniz = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      modules = [
        # Import the previous configuration.nix we used,
        # so the old configuration file still takes effect
        ./configuration.nix
        { programs.hyprland.enable = true; }
        {
          nixpkgs.config.allowUnfree = true;
        }
        # rtkit is optional but recommended
        { security.rtkit.enable = true; }
        {
          services.pipewire = {
            enable = true;
            alsa.enable = true;
            alsa.support32Bit = true;
            pulse.enable = true;
            # If you want to use JACK applications, uncomment this
            #jack.enable = true;
          };
        }
        { hardware.bluetooth.enable = true; }
        { hardware.bluetooth.powerOnBoot = true; }
        { services.blueman.enable = true; }
        home-manager.nixosModules.home-manager
        {
          home-manager.useGlobalPkgs = true;
          home-manager.useUserPackages = true;

          home-manager.users.ilia = import ./home.nix;

          # Optionally, use home-manager.extraSpecialArgs to pass
          # arguments to home.nix
        }
      ];
    };
  };
}
