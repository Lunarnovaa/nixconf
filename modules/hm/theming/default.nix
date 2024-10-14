{
  inputs,
  lib,
  config,
  pkgs,
  ...
}: {
  imports = [
    ./gtk.nix
    ./qt.nix
  ];
}
