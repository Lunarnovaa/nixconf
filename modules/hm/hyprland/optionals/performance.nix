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
  config = mkIf (config.hyprland.enable && config.performance.enable) {
    wayland.windowManager.hyprland.settings = {
      decoration = {
        blur.enabled = false;
        drop_shadow = false;
      };
      misc.vfr = true;
    };
  };
}
