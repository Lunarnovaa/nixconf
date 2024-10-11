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
      "$mod" = "SUPER";

      bind = [
        "$mod, G, exec, firefox"
        "$mod, Return, exec, alacritty"
        "$mod, P, exec, tofi-drun --drun-launch=true"
        "$mod, D, killactive,"
      ];
    };

    home.packages = with pkgs; [
      wev
    ];
  };
}
