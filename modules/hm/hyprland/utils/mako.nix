{
  config,
  lib,
  ...
}: let
  inherit (lib) mkIf;
  inherit (config.theme) colors fonts;
  #hyprland-settings = config.wayland.windowManager.hyprland.settings;
in {
  config = mkIf config.hyprland.enable {
    services.mako = {
      enable = true;

      backgroundColor = "#${colors.base01}";
      textColor = "#${colors.base05}";
      borderColor = "#${colors.base08}";
      borderRadius = 3;
      borderSize = 2;
      font = fonts.sans-serif;
      anchor = "top-center";

      width = 300;
      height = 80;

      defaultTimeout = 10000; #in miliseconds

      layer = "overlay";
    };
  };
}
