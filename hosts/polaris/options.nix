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
    gaming.enable = mkDefault true;
    server.enable = mkDefault false;
    workstation.enable = mkDefault true;
  };

  # Note for setting options: if setting to true, can use mkDefault: simply set to false by default through mkEnableOption; if setting to false; use mkForce
  firefox-vertical-tabs.enable = mkDefault true;
  fastfetch.enable = mkDefault true;
  nvidia.enable = mkDefault true;
  spicetify.enable = mkDefault true;
}
