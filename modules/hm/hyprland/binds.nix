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

        "ALT, Tab, cyclenext,"
        "ALT, Tab, bringactivetotop,"

        "ALT, 1, workspace, 1"
        "ALT, 2, workspace, 2"
        "ALT, 3, workspace, 3"
        "ALT, 4, workspace, 4"
        "$mod, 1, movetoworkspace, 1"
        "$mod, 2, movetoworkspace, 2"
        "$mod, 3, movetoworkspace, 3"
        "$mod, 4, movetoworkspace, 4"
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
