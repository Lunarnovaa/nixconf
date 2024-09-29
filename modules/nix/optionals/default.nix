{
  pkgs,
  lib,
  config,
  ...
}: let
  inherit (lib) mkDefault;
in {
  imports = [
    ./gaming/default.nix
    ./server/default.nix
    ./workstation/default.nix
  ];
}
