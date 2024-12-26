{
  lib,
  config,
  pkgs,
  ...
}: let
  inherit (lib) mkIf;
in {
  config = mkIf config.hyprland.enable {
    homes.lunarnova.packages = with pkgs; [pcmanfm];
  };
}
