{
  config,
  lib,
  pkgs,
  ...
}: let
  inherit (lib) mkIf toHyprconf;
  inherit (config.theme) wallpapers;
in {
  config = mkIf config.hyprland.enable {
    homes.lunarnova.files.".config/hypr/hyprpaper.conf" = {
      clobber = true;
      text = (toHyprconf { attrs = { 
        preload = [
          "${wallpapers.primary}"
        ];
        wallpaper = [
          ",${wallpapers.primary}"
        ];
      };});
    };
    
    systemd.user.services.hyprpaper = {
      description = "wallpaper service for hyprland";
      partOf = ["graphical-session.target"];
      wantedBy = ["graphical-session.target"];
      after = ["graphical-session.target"];
      reloadTriggers = ["${config.homes.lunarnova.files.".config/hypr/hyprpaper.conf".text}"];

      unitConfig.ConditionEnvironment = "WAYLAND_DISPLAY";
      serviceConfig = {
        ExecStart = "${pkgs.hyprpaper}/bin/hyprpaper -c /home/lunarnova/.config/hypr/hyprpaper.conf";
        Restart = "always";
        RestartSec = "10";
      };
    };
  };
}
