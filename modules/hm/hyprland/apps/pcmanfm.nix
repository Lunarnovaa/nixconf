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
in {
  config = mkIf config.hyprland.enable {
    home.packages = with pkgs; [pcmanfm];
  };
}
