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
  inherit
    (config.theme)
    colors
    fonts
    ;
  hyprland-settings = config.wayland.windowManager.hyprland.settings;
  tofiPowermenu = pkgs.pkgs.writeShellScriptBin "powermenu" ''
    #from u/timblaktu, runs this command to gracefully close apps
    HYPRCMDS=$(hyprctl -j clients | jq -j '.[] | "dispatch closewindow address:\(.address); "')

    option=$(echo -e "Poweroff\nReboot\nSuspend\nLogout\nLock" | tofi --prompt-text "choose:")
    case $option in
      Poweroff)
        hyprctl --batch $HYPRCMDS >> /tmp/hypr/hyprexitwithgrace.log 2>&1
        hyprctl dispatch exit
        shutdown now
      ;;
      Reboot)
        hyprctl --batch $HYPRCMDS >> /tmp/hypr/hyprexitwithgrace.log 2>&1
        hyprctl dispatch exit
        reboot
      ;;
      Suspend)
        systemctl suspend
      ;;
      Logout)
        hyprctl --batch $HYPRCMDS >> /tmp/hypr/hyprexitwithgrace.log 2>&1
        hyprctl dispatch exit
      ;;
      Lock)
        hyprlock
      ;;
    esac
  '';
in {
  config = mkIf config.hyprland.enable {
    programs.waybar = {
      enable = true;
      settings = {
        mainBar = {
          layer = "top";
          position = "top";
          height = 24; #makes the bar as short as possible
          margin-top = 0;
          margin-left = 10;
          margin-right = 10;
          margin-bottom = 2;
          modules-left = ["hyprland/workspaces" "tray"];
          modules-center = ["hyprland/window"];
          modules-right = ["clock" "privacy" "network" "bluetooth" "custom/powermenu"];

          "hyprland/workspaces" = {
            format = "[{id}]";
          };

          "hyprland/window" = {
            format = "[{title}]";
          };
          "clock" = {
            timezone = "${osConfig.time.timeZone}";
            format = "[{:%e.%m.%y %H:%M}]";
          };

          "network" = {
            format-ethernet = "[󰈀]";
            format-wifi = "[{icons}: {essid}]";
            format-icons = ["󰤟" "󰤢" "󰤥" "󰤨"];
            format-disconnected = "󰤭";
            on-click = "alacritty -e nmtui";
          };

          "bluetooth" = {
            format-disabled = "[󰂲]";
            format-off = "[󰂲]";
            format-on = "[󰂯]";
            format-connected = "[󰂱: {num_connections}]";
            tooltip = true;
            tooltip-format = "{device_enumerate}";
            tooltip-format-enumerate-connected = "{device_alias}";
            tooltip-format-enumerate-connected-battery = "{device_alias} - {device_battery_percentage}";
            on-click = "blueberry";
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
          "custom/powermenu" = {
            format = "[⏻]";
            on-click = ''${tofiPowermenu}/bin/powermenu'';
          };
        };
      };
      style = ''
        * {
          font-size: 13px;
          min-height: 0px;
          border-radius: 6px;
          color: #${colors.base05};
          font-family: "${fonts.sans-serif}, ${fonts.monospace}, ${fonts.emoji}";
        }
        .module {
          padding: 0em 1em;
        }
        .modules-right {
          margin-left: 8px;
        }
        .modules-left {
          margin-right: 8px;
        }
        #custom-powermenu,
        #bluetooth,
        #network {
          font-size: 15px;
        }
        window#waybar {
          background-color: #${colors.base00};
        }
      '';
    };
  };
}
