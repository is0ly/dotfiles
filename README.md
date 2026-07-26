# NixOS desktop

Declarative NixOS configuration for an x86-64 desktop with NVIDIA, Hyprland,
Home Manager, LUKS and Btrfs.

## Installation from the NixOS ISO

The repository can be installed directly from a public Git host. Cloning it in
the live environment is not required.

### 1. Identify the target disk

```console
$ lsblk -d -o NAME,SIZE,MODEL,SERIAL
$ ls -l /dev/disk/by-id/
```

Use the whole-disk path from `/dev/disk/by-id`, not a name such as
`/dev/nvme0n1`. Carefully verify the selected model, capacity and serial
number—the installation destroys all data on that disk.

### 2. Check the installation plan

Replace `OWNER/REPOSITORY` and the example disk ID:

```console
$ sudo nix run github:nix-community/disko#disko-install -- \
    --dry-run \
    --flake 'github:OWNER/REPOSITORY#desktop' \
    --disk main '/dev/disk/by-id/nvme-WD_BLACK_SN850X_2000GB_SERIAL' \
    --write-efi-boot-entries
```

The dry run builds and prints the installation actions without partitioning or
formatting the target disk.

### 3. Create the temporary LUKS password file

```console
$ sudo bash -c '
    umask 077
    read -rsp "New LUKS password: " password
    printf "\n"
    read -rsp "Repeat LUKS password: " confirmation
    printf "\n"
    test "$password" = "$confirmation" || {
      echo "Passwords do not match"
      exit 1
    }
    printf "%s" "$password" > /tmp/disko-password
  '
```

The password file is read only while LUKS is created. It is not copied into the
installed system.

### 4. Install

Run the same command without `--dry-run`:

```console
$ sudo nix run github:nix-community/disko#disko-install -- \
    --flake 'github:OWNER/REPOSITORY#desktop' \
    --disk main '/dev/disk/by-id/nvme-WD_BLACK_SN850X_2000GB_SERIAL' \
    --write-efi-boot-entries
```

After a successful installation:

```console
$ sudo rm -f /tmp/disko-password
$ reboot
```

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
