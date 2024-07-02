# nixos-config

Configuration for my personal nixOS setup.

## Partition layout

- `/dev/nvme1n1p1` -- /boot 1GB, FAT32
- `/dev/nvme1n1p2` -- the rest, btrfs
  - `@` -- `/` mount options: `compress=zstd`
  - `@home` -- `/home` mount options: `compress=zstd`
  - `@nix` -- `/nix` mount options: `compress=zstd, noatime`
  - `@swap` -- `/.swap`
    - swapfile 32GB

The layout above is declaratively configured in `disk-config.nix` file.

**Before you apply the configuration review the file and update the device name
accordingly.**

To apply the configuration the follow command can be used:
```sh
$ sudo nix --experimental-features "nix-command flakes" run github:nix-community/disko -- \
  --mode disko /disk-config.nix
```
