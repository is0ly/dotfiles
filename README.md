# This is my NixOS configuration

## NixOS, flakes, homemanager tracked with git:

modify disk configuration in disk-config.nix

run

`
  sudo nix --experimental-features "nix-command flakes" run github:nix-community/disko -- --mode disko /mnt/etc/nixos/dotfiles/disk-config.nix
`
 
`
mount | grep /mnt
`

`
  sudo nixos-generate-config --no-filesystems --root /mnt
`

`
sudo nix --experimental-features "nix-command flakes" flake lock  
`

`
  sudo nixos-install --root /mnt --flake '/mnt/etc/nixos/dotfiles#spotniz'
`
`
  reboot
`
