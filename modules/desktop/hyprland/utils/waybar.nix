{
  config,
  pkgs,
  lib,
  ...
}: let
  inherit (lib.modules) mkIf;
  inherit (builtins) toJSON;
  inherit (config.theme) colors fonts;
  #hyprland-settings = config.wayland.windowManager.hyprland.settings;
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
    hjem.users.lunarnova = {
      packages = with pkgs; [waybar];
      files = {
        ".config/waybar/config.jsonc".text = toJSON {
          layer = "top";
          position = "top";
          height = 24; #makes the bar as short as possible
          margin-top = 0;
          margin-left = 10;
          margin-right = 10;
          margin-bottom = 2;
          modules-left = ["hyprland/workspaces" "tray"];
          modules-center = ["hyprland/window"];
          modules-right = ["hyprland/language" "battery" "pulseaudio" "network" "bluetooth" "custom/powermenu" "clock"];

          # left modules
          "hyprland/workspaces" = {
            format = "[{id}]";
          };
          "tray" = {
            icon-size = 21;
            spacing = 10;
          };

          # center modules
          "hyprland/window" = {
            format = "[{title}]";
          };

          #right modules
          "hyprland/language" = {
            format = "[{}]";
          };
          "battery" = {
            format = "{icon}  [{capacity}%]";
            format-icons = ["" "" "" "" ""];
            states = {
              warning = 30;
              critical = 15;
            };
          };
          "pulseaudio" = {
            format = "{icon}  [{volume}%]";
            format-muted = " ";
            format-icons = {
              default = ["" ""];
            };
            on-click = "${pkgs.pwvucontrol}/bin/pwvucontrol";
          };
          "network" = {
            format-ethernet = "󰈀";
            format-wifi = "{icon}";
            tooltip-format-wifi = "{essid} @ {signalStrength}%";
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
          "custom/powermenu" = {
            format = "⏻";
            on-click = ''${tofiPowermenu}/bin/powermenu'';
          };
          "clock" = {
            timezone = "${config.time.timeZone}";
            format = "[{:%m.%d.%y %H:%M}]";
          };
        };
        ".config/waybar/style.css".text = ''
          * {
            font-size: 13px;
            min-height: 0px;
            border-radius: 6px;
            color: ${colors.base05};
            font-family: "${fonts.sans-serif}, ${fonts.monospace}";
          }
          .module {
            padding: 0em 0.8em;
          }
          #battery.warning {
            color: ${colors.base09};
          }
          #battery.critical {
            color: ${colors.base08};
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
            background-color: ${colors.base00};
          }
        '';
      };
    };
  };
}
