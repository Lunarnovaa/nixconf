{
  config,
  pkgs,
  lib,
  ...
}: let
  inherit (lib) mkIf;
  inherit (config.theme) colors;
  hyprland-settings = config.wayland.windowManager.hyprland.settings;
in {
  config = mkIf config.hyprland.enable {
    programs.tofi = {
      enable = true;
      settings = {
        outline-width = 0;
        border-width = hyprland-settings.general.border_size;
        corner-radius = hyprland-settings.decoration.rounding;
        width = "25%";
        height = "15%";
        font = "${pkgs.inter}/share/fonts/truetype/Inter.ttc";
        font-size = 13;
        background-color = "#${colors.base00}";
        border-color = "#${colors.base08}";
        text-color = "#${colors.base05}";
        selection-color = "#${colors.base12}";
      };
    };
  };
}
