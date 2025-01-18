{
  lib,
  config,
  pkgs,
  ...
}: let
  inherit (lib.modules) mkIf;
  inherit (config.profiles) workstation;
in {
  config = mkIf workstation.apps.obsidian {
    hjem.users.lunarnova = {
      packages = with pkgs; [obsidian];
    };
  };
}
