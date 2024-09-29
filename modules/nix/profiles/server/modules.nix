{
  pkgs,
  lib,
  config,
  ...
}: let
  inherit (lib) mkDefault;
in {
  imports = [
    ./minecraft-server.nix
  ];

  minecraft-server.enable =
    mkDefault false;
}
