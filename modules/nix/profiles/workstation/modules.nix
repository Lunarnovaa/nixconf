{
  pkgs,
  lib,
  config,
  ...
}: let
  inherit (lib) mkIf mkDefault;
in {
  imports = [
    ./minecraft-server.nix
  ];
  config =
    mkIf config.profile-workstation.enable {
    };
}
