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
  killactive = pkgs.pkgs.writeShellScriptBin "save-steam" ''
    if [ "$(hyprctl activewindow -j | jq -r ".class")" = "Steam" ]; then
        xdotool getactivewindow windowunmap
    else
        hyprctl dispatch killactive ""
    fi
  '';
in {
  config = mkIf config.hyprland.enable {
    wayland.windowManager.hyprland.settings = {
      "$mod" = "SUPER";

      bind = [
        "$mod, G, exec, firefox"
        "$mod, Return, exec, alacritty"
        "$mod, D, exec, ${killactive}/bin/save-steam"

        ", Print, exec, grimblast --notify --freeze copy area"

        "$mod, Tab, cyclenext,"
        "$mod, Tab, bringactivetotop,"
      ];

      bindm = [
        "$mod, mouse:272, movewindow"
        "$mod, mouse:273, resizewindow"
      ];

      bindr = [
        "SUPER, SUPER_L, exec, tofi-drun --drun-launch=true"
      ];
    };

    home.packages = with pkgs; [
      wev
      grimblast
    ];
  };
}
