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
        #"workspace 1, class:(steam), class:(lutris)" #steam + lutris
        #"workspace 2, class:(vesktop), initialTitle:(Spotify Premium)" #discord, spotify
        #"workspace 3, class(firefox), class(code-url-handler)" #firefox, vscode
      ];

      workspace = [
        # Smart Gaps
        #"w[t1], gapsout:0, gapsin:0, border: 0, rounding:0"
        #"w[tg1], gapsout:0, gapsin:0, border: 0, rounding:0"
      ];
    };
  };
}
