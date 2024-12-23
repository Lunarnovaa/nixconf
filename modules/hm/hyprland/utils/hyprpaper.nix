{
  config,
  lib,
  ...
}: let
  inherit (lib) mkIf;
  inherit (config.theme) wallpapers;
in {
  config = mkIf config.hyprland.enable {
    services.hyprpaper = {
      enable = true;
      settings = {
        preload = [
          "${wallpapers.primary}"
        ];
        wallpaper = [
          ",${wallpapers.primary}"
        ];
      };
    };
  };
}
