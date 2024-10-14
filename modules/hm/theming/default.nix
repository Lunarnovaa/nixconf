{
  inputs,
  lib,
  config,
  pkgs,
  ...
}: {
  imports = [
    ./gtk.nix
    ./theme.nix
    ./qt.nix
  ];
}
