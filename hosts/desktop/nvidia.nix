{
  config,
  lib,
  ...
}:

let
  cfg = config.desktop.nvidia;
in
{
  options.desktop.nvidia.enable = lib.mkEnableOption "NVIDIA graphics support" // {
    default = true;
  };

  config = lib.mkIf cfg.enable {
    # The kernel module is open source, while the OpenGL/Vulkan/CUDA userspace
    # libraries are still proprietary.
    nixpkgs.config.allowUnfree = true;

    services.xserver.videoDrivers = [ "nvidia" ];

    hardware.graphics = {
      enable = true;
      enable32Bit = true;
    };

    hardware.nvidia = {
      open = true;
      modesetting.enable = true;
      package = config.boot.kernelPackages.nvidiaPackages.stable;

      # This is a desktop GPU, so laptop-oriented fine-grained power management
      # should stay disabled.
      powerManagement = {
        enable = true;
        finegrained = false;
      };
    };
  };
}
