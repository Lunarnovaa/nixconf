{
  config,
  lib,
  ...
}: let
  inherit (lib.modules) mkIf; 
  inherit (lib.extendedLib.generators) toHyprconf;
in {
    config = mkIf (config.hyprland.enable && config.hyprland.smartgaps.enable) {
    hjem.users.lunarnova.files.".config/hypr/hyprland.conf".text = toHyprconf {
      attrs = {
        windowrulev2 = [
          "bordersize 0, floating:0, onworkspace:w[tv1]"
          "rounding 0, floating:0, onworkspace:w[tv1]"
          "bordersize 0, floating:0, onworkspace:f[1]"
          "rounding 0, floating:0, onworkspace:f[1]"
        ];

        workspace = [
          "w[tv1], gapsout:0, gapsin:0"
          "f[1], gapsout:0, gapsin:0"
        ];
      };
    };
  };

}