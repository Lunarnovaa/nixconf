{
  lib,
  config,
  pkgs,
  ...
}: let
  inherit
    (lib)
    mkIf
    ;
  inherit
    (config.profiles)
    workstation
    ;
in {
  config = mkIf workstation.apps.obsidian {
    home.packages = with pkgs; [obsidian];
  };
}
