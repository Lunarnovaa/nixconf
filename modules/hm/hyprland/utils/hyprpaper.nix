{
  config,
  inputs,
  pkgs,
  options,
  lib,
  ...
}: let
  inherit
    (lib)
    mkIf
    ;
  wallpaper1 = "/home/lunarnova/wallpapers/nauragarden.png";
in {
  config = mkIf config.hyprland.enable {
    services.hyprpaper = {
      enable = true;
      settings = {
        preload = [
          wallpaper1
        ];
        wallpaper = [
          ",${wallpaper1}"
        ];
      };
    };
  };
}
