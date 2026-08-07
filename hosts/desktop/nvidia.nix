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
    # The driver caches freed buffers instead of returning them, which suits
    # games but not compositors: niri constantly creates and destroys buffers
    # of varying sizes, so the pool grows without ever shrinking. Setting the
    # reuse ratio to 0 disables that caching for niri only.
    environment.etc."nvidia/nvidia-application-profiles-rc.d/50-limit-free-buffer-pool".text =
      builtins.toJSON
        {
          rules = [
            {
              pattern = {
                feature = "procname";
                matches = "niri";
              };
              profile = "Limit Free Buffer Pool On Wayland Compositors";
            }
          ];
          profiles = [
            {
              name = "Limit Free Buffer Pool On Wayland Compositors";
              settings = [
                {
                  key = "GLVidHeapReuseRatio";
                  value = 0;
                }
              ];
            }
          ];
        };
  };
}
