default:
    @just --list

fmt:
    find . \
        -type f \
        -name '*.nix' \
        -not -path './.git/*' \
        -print0 \
        | xargs -0 nixfmt

check:
    nix flake check

rebuild:
    git add -A
    sudo nixos-rebuild switch --flake .#nixos

update:
    nix flake update

apply: fmt check rebuild
