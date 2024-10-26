{
  config,
  lib,
  ...
}: let
  inherit
    (lib)
    mkIf
    mkMerge
    ;
  inherit
    (config.hyprland)
    monitors
    ;
in {
  config = mkIf config.hyprland.enable {
    wayland.windowManager.hyprland.settings = {
      windowrule = [
        #"workspace 3, class:(steam), class:(lutris)" #gaming
        #"workspace 2, class:(vesktop), initialTitle:(Spotify Premium)" #comforts
        #"workspace 1, class(firefox), class(code-url-handler)" #productivity
      ];

      workspace = mkMerge [
        monitors.rules
        [
          # Smart Gaps
          #"w[t1], gapsout:0, gapsin:0, border: 0, rounding:0"
          #"w[tg1], gapsout:0, gapsin:0, border: 0, rounding:0"
        ]
      ];
    };
  };
}
