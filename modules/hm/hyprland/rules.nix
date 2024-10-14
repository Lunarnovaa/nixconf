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
in {
  config = mkIf config.hyprland.enable {
    wayland.windowManager.hyprland.settings = {
      windowrule = [
      ];

      workspace = [
        # Smart Gaps
        #"w[t1], gapsout:0, gapsin:0, border: 0, rounding:0"
        #"w[tg1], gapsout:0, gapsin:0, border: 0, rounding:0"
      ];
    };
  };
}
