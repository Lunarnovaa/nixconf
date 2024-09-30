{
  config,
  pkgs,
  lib,
  ...
}: let
  inherit
    (lib)
    mkDefault
    mkForce
    ;
in {
  imports = [
    ./../../modules/options/default.nix
  ];
  profile-gaming.enable = mkDefault false;
  profile-server.enable = mkDefault false;
  profile-workstation.enable = mkDefault true;
}
