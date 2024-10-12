{
  config,
  osConfig,
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
    programs.waybar = {
      enable = true;
      settings = {
        mainBar = {
          layer = "top";
          position = "top";
          height = 30;
          margin-top = 8;
          margin-left = 10;
          margin-right = 10;
          margin-bottom = 4;
          modules-left = ["hyprland/workspaces" "hyprland/window"];
          modules-center = ["clock"];
          modules-right = ["network" "privacy" "tray"];

          "clock" = {
            timezone = "${osConfig.time.timeZone}";
            tooltip = true;
            tooltip-format = "{:%m-%Y-%d}";
          };

          "network" = {
            format = "{ifname}";
            format-ethernet = "Wired";
            tooltip-format-wifi = "{essid} ({signalStrength}%)";
            tooltip-format-ethernet = "{ifname}";
            tooltip-format-disconnected = "Disconnected";
          };

          "privacy" = {
            modules = [
              {
                type = "screenshare";
                tooltip = true;
                tooltip-icon-size = 12;
              }
              {
                type = "audio-in";
                tooltip = true;
                tooltip-icon-size = 12;
              }
            ];
          };
          "tray" = {
            icon-size = 21;
            spacing = 10;
          };
        };
      };
      style = ''
        * {
          font-size: 4px;
          min-height: 0;
          border-radius: 6px;
        }
        #tray {
          margin: 0px 4px;
        }
      '';
    };
  };
}
