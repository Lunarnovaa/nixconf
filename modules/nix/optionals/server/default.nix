{
  pkgs,
  lib,
  config,
  ...
}: {
  imports = [
    ./minecraft-server.nix
  ];
}
