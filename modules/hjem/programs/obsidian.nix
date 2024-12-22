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
    homes.lunarnova = {
      packages = with pkgs; [obsidian];
    };
  };
}
