{
  config,
  inputs,
  pkgs,
  lib,
  ...
}: let
  inherit (lib.modules) mkIf;
  inherit (lib.extendedLib.generators) toHyprconf;
  inherit (config.theme) colors;
  inherit (config.hyprland) monitors;
  inherit (builtins) mapAttrs substring;

  # cleansing the imported colors from basix of the prepended '#'
  # bc colors don't work here without it
  # optimized by diniamo
  hyprCol = mapAttrs (n: v: substring 1 (-1) v) colors;

  startupScript = pkgs.pkgs.writeShellScriptBin "start" ''
    dbus-update-activation-environment --systemd WAYLAND_DISPLAY XDG_CURRENT_DESKTOP
    ${pkgs.mako}/bin/mako &
    systemctl --user start ${pkgs.kdePackages.polkit-kde-agent-1}/libexec/polkit-kde-authentication-agent-1 &
    waybar &
    ${pkgs.sway-audio-idle-inhibit}/bin/sway-audio-idle-inhibit &
  '';
in {
  config = mkIf config.hyprland.enable {
    hjem.users.lunarnova = {
      packages = [inputs.niqspkgs.packages.x86_64-linux.bibata-hyprcursor];

      # hjem is working on implementation
      #sessionVariables.NIXOS_OZONE_WL = "1";

      files.".config/hypr/hyprland.conf".text = toHyprconf {
        attrs = {
          exec-once = ''${startupScript}/bin/start'';

          monitor = monitors.configuration;

          input = {
            # Set Colemak as the primary layout and QWERTY as secondary
            kb_layout = "us,us";
            kb_variant = "colemak,";

            # Remap CAPSLOCK to CTRL, WIN+SPACE kb layout change
            kb_options = "ctrl:nocaps,grp:win_space_toggle";
            accel_profile = "flat";

            sensitivity = "-0.2";
          };

          env = [
            "HYPRCURSOR_THEME,Bibata-modern"
            "HYPRCURSOR_SIZE,24"
          ];

          general = {
            border_size = "3";
            gaps_out = "4,10,10,10";
            gaps_in = "4";

            "col.inactive_border" = "0x00${hyprCol.base03}";
            "col.active_border" = "0xee${hyprCol.base04} 0xee${hyprCol.base06} 45deg"; #Gradient from surface2 to red
          };

          decoration = {
            rounding = "5";

            shadow = {
              #range = 6;
              render_power = 1;
            };
          };
        };
      };
    };
  };
}
