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
  profile = {
    gaming.enable = mkDefault false;
    server.enable = mkDefault false;
    workstation.enable = mkDefault true;
  };
}
