# NixOS desktop

Declarative NixOS configuration for an x86-64 desktop with NVIDIA, Hyprland,
Home Manager, LUKS and Btrfs.

## Installation from the NixOS ISO

The repository can be installed directly from a public Git host. Cloning it in
the live environment is not required.

Boot the x86-64 NixOS Live ISO, connect to the internet and run:

```console
$ sudo nix \
    --extra-experimental-features 'nix-command flakes' \
    run 'github:is0ly/dotfiles#install'
```

The interactive installer:

1. detects the target hardware with `nixos-generate-config --no-filesystems`;
2. enables NVIDIA support only when an NVIDIA PCI device is present;
3. shows only whole physical disks with numbered `/dev/disk/by-id` entries;
4. asks which disk number to use and validates the selection;
5. runs `disko-install --dry-run`;
6. requires an explicit `ERASE` confirmation;
7. asks twice for the LUKS and `ilia` login passwords;
8. partitions, formats and installs the system;
9. copies the exact generated configuration to `/etc/nixos`;
10. removes temporary password files automatically.

## Target-specific hardware configuration

`hosts/desktop/hardware-configuration.nix` is a portable NVMe fallback used
only before the installer runs. The installer copies the flake to a temporary
directory and replaces this file with output from:

```console
$ nixos-generate-config --show-hardware-config --no-filesystems
```

The generated module is used for both the dry run and the actual system build.
The complete resulting flake is copied to `/etc/nixos` in the installed system.
Disk layout, filesystems, Btrfs subvolumes and mount points remain exclusively
under Disko's control.

After the first successful boot, review
`/etc/nixos/hosts/desktop/hardware-configuration.nix` and commit it back to the
repository. Future reinstalls of the same computer will then also have the exact
hardware module available as a fallback.
