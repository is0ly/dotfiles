{ lib, ... }:

{
  disko.devices.disk.main = {
    # disko-install overrides this value through:
    # --disk main /dev/disk/by-id/<drive>
    device = lib.mkDefault "/dev/disk/by-id/REPLACE_WITH_INSTALL_TARGET";
    type = "disk";

    content = {
      type = "gpt";

      partitions = {
        esp = {
          name = "ESP";
          size = "1G";
          type = "EF00";

          content = {
            type = "filesystem";
            format = "vfat";
            mountpoint = "/boot";
            mountOptions = [ "umask=0077" ];
          };
        };

        luks = {
          size = "100%";

          content = {
            type = "luks";
            name = "crypted";

            # This file is needed only while formatting the disk. It must be
            # created in the installer environment and is never copied to the
            # installed system or committed to the repository.
            passwordFile = "/tmp/disko-password";

            settings.allowDiscards = true;

            content = {
              type = "btrfs";
              extraArgs = [ "-f" ];

              subvolumes = {
                "@root" = {
                  mountpoint = "/";
                  mountOptions = [
                    "compress=zstd"
                    "noatime"
                  ];
                };

                "@home" = {
                  mountpoint = "/home";
                  mountOptions = [
                    "compress=zstd"
                    "noatime"
                  ];
                };

                "@nix" = {
                  mountpoint = "/nix";
                  mountOptions = [
                    "compress=zstd"
                    "noatime"
                  ];
                };

                "@snapshots" = {
                  mountpoint = "/.snapshots";
                  mountOptions = [
                    "compress=zstd"
                    "noatime"
                  ];
                };
              };
            };
          };
        };
      };
    };
  };
}
