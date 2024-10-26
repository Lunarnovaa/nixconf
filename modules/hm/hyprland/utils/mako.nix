{
  config,
  lib,
  ...
}: let
  inherit
    (lib)
    mkIf
    ;
  inherit
    (config.theme)
    colors
    fonts
    ;
  #hyprland-settings = config.wayland.windowManager.hyprland.settings;
in {
  config = mkIf config.hyprland.enable {
    programs.mako = {
      enable = true;
      backgroundColor = "#${colors.base01}";
      textColor = "#${colors.base05}";
      borderColor = "#${colors.base08}";
      borderRadius = 3;
      font = fonts.sans-serif;
    };
  };
}
