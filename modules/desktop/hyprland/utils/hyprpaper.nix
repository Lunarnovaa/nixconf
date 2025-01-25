{
  config,
  lib,
  pkgs,
  ...
}: let
  inherit (lib.attrsets) mergeAttrsList optionalAttrs;
  inherit (lib.modules) mkIf;
  inherit (lib.extendedLib.generators) toHyprconf;
  inherit (config.theme) wallpapers;

  hyprpaper-conf = pkgs.writeTextFile {
    name = "hyprpaper-conf";
    text = toHyprconf {
      attrs = mergeAttrsList [
        {
          preload = [
            "${wallpapers.primary}"
          ];
          wallpaper = [
            ",${wallpapers.primary}"
          ];
        }
        (optionalAttrs config.sysconf.powersave {
          ipc = false;
        })
      ];
    };
  };
in {
  config = mkIf config.hyprland.enable {
    systemd.user.services.hyprpaper = {
      description = "wallpaper service for hyprland";
      partOf = ["graphical-session.target"];
      wantedBy = ["graphical-session.target"];
      after = ["graphical-session.target"];
      reloadTriggers = ["${hyprpaper-conf}"];

      unitConfig.ConditionEnvironment = "WAYLAND_DISPLAY";
      serviceConfig = {
        ExecStart = "${pkgs.hyprpaper}/bin/hyprpaper -c ${hyprpaper-conf}";
        Restart = "always";
        RestartSec = "10";
      };
    };
  };
}
