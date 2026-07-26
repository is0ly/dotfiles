# NixOS desktop

Declarative NixOS configuration for an x86-64 desktop with NVIDIA, Hyprland,
Home Manager, LUKS and Btrfs.

## Installation from the NixOS ISO

The repository can be installed directly from a public Git host. Cloning it in
the live environment is not required.

Boot the x86-64 NixOS Live ISO, connect to the internet and run:

```console
$ sudo nix run 'github:is0ly/dotfiles#install'
```

The interactive installer:

1. shows physical disks and their persistent `/dev/disk/by-id` names;
2. asks which whole disk to use and validates the selection;
3. runs `disko-install --dry-run`;
4. requires an explicit `ERASE` confirmation;
5. asks twice for the LUKS and `ilia` login passwords;
6. partitions, formats and installs the system;
7. removes temporary password files automatically.

## Target-specific hardware configuration

`hosts/desktop/hardware-configuration.nix` contains a portable NVMe desktop
baseline so the remote flake can be installed without first cloning and editing
the repository.

After the first boot, generate the exact hardware module on the desktop:

```console
$ sudo nixos-generate-config --show-hardware-config \
    > /tmp/hardware-configuration.nix
```

Review it, remove any `fileSystems` and `swapDevices` definitions, then replace
`hosts/desktop/hardware-configuration.nix` and commit the result. Disk layout,
filesystems, Btrfs subvolumes and mount points remain exclusively in
`hosts/desktop/disk.nix`.
