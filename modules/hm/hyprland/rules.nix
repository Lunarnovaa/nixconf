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
      windowrulev2 = [
        "workspace 3, class:(steam)" #gaming
        "workspace 3, class:(lutris)"

        "workspace 2, class:(vesktop)" #comforts
        "workspace 2, initialTitle:(Spotify Premium)"

        "workspace 1, class:(firefox)" #productivity
        "workspace 1, initialTitle:(Visual Studio Code)"
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
