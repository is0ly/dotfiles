# shellcheck shell=bash

set -Eeuo pipefail

flake_ref="${NIXOS_INSTALL_FLAKE:-github:is0ly/dotfiles#desktop}"
luks_password_file="/tmp/disko-password"
luks_password_created=false
temporary_directory=""
working_flake=""

cleanup() {
  unset luks_password luks_confirmation login_password login_confirmation

  if [[ "$luks_password_created" == true ]]; then
    rm -f -- "$luks_password_file"
  fi

  if [[ "$temporary_directory" == /tmp/nixos-desktop-install.* ]]; then
    rm -rf -- "$temporary_directory"
  fi
}

fail() {
  printf 'Error: %s\n' "$*" >&2
  exit 1
}

trap cleanup EXIT

if [[ "$(uname -s)" != "Linux" || "$(uname -m)" != "x86_64" ]]; then
  fail "run the installer from an x86-64 NixOS Live ISO"
fi

if [[ "$EUID" -ne 0 ]]; then
  fail "run this command with sudo"
fi

source_flake="${flake_ref%#*}"
flake_attribute="${flake_ref##*#}"

[[ -d "$source_flake" ]] || fail "cannot access the installer flake source"
[[ -n "$flake_attribute" ]] || fail "the installer flake attribute is missing"

temporary_directory="$(mktemp -d /tmp/nixos-desktop-install.XXXXXXXXXX)"
working_flake="$temporary_directory/config"
mkdir -p -- "$working_flake"
cp -a -- "$source_flake/." "$working_flake/"

hardware_config="$working_flake/hosts/desktop/hardware-configuration.nix"
chmod u+w -- "$hardware_config"

printf '\nDetecting hardware for the target configuration.\n\n'
nixos-generate-config \
  --show-hardware-config \
  --no-filesystems \
  > "$hardware_config"

detected_hardware="$working_flake/hosts/desktop/detected-hardware.nix"
chmod u+w -- "$detected_hardware"

if lspci -Dn | grep -qi ' 10de:'; then
  nvidia_enabled=true
  printf 'NVIDIA PCI device detected; NVIDIA support will be enabled.\n'
else
  nvidia_enabled=false
  printf 'No NVIDIA PCI device detected; NVIDIA support will be disabled.\n'
fi

printf \
  '{ ... }: { desktop.nvidia.enable = %s; }\n' \
  "$nvidia_enabled" \
  > "$detected_hardware"
unset nvidia_enabled

flake_ref="path:$working_flake#$flake_attribute"

printf '\nAvailable physical disks:\n\n'
lsblk -d -p -o NAME,SIZE,MODEL,SERIAL,TYPE

printf '\nPersistent disk names:\n\n'
ls -l /dev/disk/by-id/

printf '\nEnter the full path of the target disk from /dev/disk/by-id/:\n> '
read -r target_disk

case "$target_disk" in
  /dev/disk/by-id/*) ;;
  *) fail "use a full path from /dev/disk/by-id/" ;;
esac

[[ -b "$target_disk" ]] || fail "$target_disk is not a block device"

resolved_disk="$(readlink -f -- "$target_disk")"
disk_type="$(lsblk -d -n -o TYPE -- "$resolved_disk")"
[[ "$disk_type" == "disk" ]] || fail "select a whole disk, not a partition"
[[ ! -e "$luks_password_file" ]] || fail "$luks_password_file already exists"

printf '\nThe following disk will be completely erased:\n\n'
lsblk -d -p -o NAME,SIZE,MODEL,SERIAL,TYPE -- "$resolved_disk"

printf '\nRunning a safe dry run first.\n\n'
disko-install \
  --dry-run \
  --flake "$flake_ref" \
  --disk main "$target_disk" \
  --write-efi-boot-entries

printf '\nTo continue, type ERASE in uppercase:\n> '
read -r erase_confirmation
[[ "$erase_confirmation" == "ERASE" ]] || fail "installation cancelled"

while true; do
  read -r -s -p "New LUKS password: " luks_password
  printf '\n'
  read -r -s -p "Repeat LUKS password: " luks_confirmation
  printf '\n'

  [[ -n "$luks_password" ]] || {
    printf 'The LUKS password cannot be empty.\n' >&2
    continue
  }

  [[ "$luks_password" == "$luks_confirmation" ]] && break
  printf 'The LUKS passwords do not match.\n' >&2
done

umask 077
printf '%s' "$luks_password" > "$luks_password_file"
luks_password_created=true
unset luks_password luks_confirmation

while true; do
  read -r -s -p "Password for user ilia: " login_password
  printf '\n'
  read -r -s -p "Repeat password for user ilia: " login_confirmation
  printf '\n'

  [[ -n "$login_password" ]] || {
    printf 'The user password cannot be empty.\n' >&2
    continue
  }

  [[ "$login_password" == "$login_confirmation" ]] && break
  printf 'The user passwords do not match.\n' >&2
done

login_hash="$(printf '%s\n' "$login_password" | mkpasswd -m yescrypt -s)"
unset login_password login_confirmation

system_config="$temporary_directory/system-config.json"

printf \
  '{"users":{"users":{"ilia":{"initialHashedPassword":"%s"}}}}' \
  "$login_hash" \
  > "$system_config"
unset login_hash

printf '\nStarting disk partitioning and NixOS installation.\n\n'
disko-install \
  --flake "$flake_ref" \
  --disk main "$target_disk" \
  --system-config "$(< "$system_config")" \
  --extra-files "$working_flake" /etc/nixos \
  --write-efi-boot-entries

printf '\nInstallation complete.\n'
printf 'The detected hardware configuration was copied to /etc/nixos.\n'
printf 'Reboot the computer and remove the Live ISO.\n'
