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
        swaylock
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
          modules-right = ["battery" "network" "bluetooth" "custom/powermenu" "clock"];

          "hyprland/workspaces" = {
            format = "[{id}]";
          };

          "hyprland/window" = {
            format = "[{title}]";
          };
          "battery" = {
            format = "{icon} ({capacity}%)";
            format-icons = ["" "" "" "" ""];
            states = {
              warning = 30;
              critical = 15;
            };
          };
          "clock" = {
            timezone = "${osConfig.time.timeZone}";
            format = "[{:%e.%m.%y %H:%M}]";
          };

          "network" = {
            format-ethernet = "󰈀";
            format-wifi = "{icons}: {essid}";
            format-icons = ["󰤟" "󰤢" "󰤥" "󰤨"];
            format-disconnected = "󰤭";
            on-click = "alacritty -e nmtui";
          };

          "bluetooth" = {
            format-disabled = "󰂲";
            format-off = "󰂲";
            format-on = "󰂯";
            format-connected = "󰂱: {num_connections}";
            tooltip = true;
            tooltip-format = "{device_enumerate}";
            tooltip-format-enumerate-connected = "{device_alias}";
            tooltip-format-enumerate-connected-battery = "{device_alias} - {device_battery_percentage}";
            on-click = "blueberry";
          };

          "tray" = {
            icon-size = 21;
            spacing = 10;
          };
          "custom/powermenu" = {
            format = "⏻";
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
          font-family: "${fonts.sans-serif}, ${fonts.monospace}";
        }
        .module {
          padding: 0em 0.8em;
        }
        #battery.warning {
          color: #${colors.base09};
        }
        #battery.critical {
          color: #${colors.base08};
        }
        #network {
          font-size: 16px;
        }
        #custom-powermenu {
          font-size: 15px;
        }
        #bluetooth {
          font-size: 17px
        }
        window#waybar {
          background-color: #${colors.base00};
        }
      '';
    };
  };
}
