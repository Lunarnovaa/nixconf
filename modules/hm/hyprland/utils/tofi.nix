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
      };
    };
  };
}
