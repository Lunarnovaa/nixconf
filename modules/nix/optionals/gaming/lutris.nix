{
  config,
  lib,
  pkgs,
  ...
}: let
  inherit (lib) mkIf;
  inherit (config.profiles) gaming;
in {
  config = mkIf gaming.apps.lutris {
    environment.systemPackages = with pkgs; [
      lutris
    ];
  };
}
