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
        "workspace 3, class:(org.prismlauncher.PrismLauncher)"

        "workspace 2, class:(vesktop)" #comforts
        "workspace 2, initialTitle:(Spotify Premium)"

        "workspace 1, class:(firefox)" #productivity
        "workspace 1, initialTitle:(Visual Studio Code)"
      ];

      workspace = mkMerge [
        monitors.rules
        [
          # for smart gaps, reference https://wiki.hyprland.org/Configuring/Workspace-Rules/#smart-gaps
        ]
      ];
    };
  };
}
