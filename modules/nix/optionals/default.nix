{
  pkgs,
  lib,
  config,
  ...
}: {
  imports = [
    ./gaming/default.nix
    ./server/default.nix
    ./workstation/default.nix
  ];
}
