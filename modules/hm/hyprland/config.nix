{
  config,
  inputs,
  pkgs,
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
    ;
  inherit
    (config.hyprland)
    monitors
    ;
  startupScript = pkgs.pkgs.writeShellScriptBin "start" ''
    dbus-update-activation-environment --systemd WAYLAND_DISPLAY XDG_CURRENT_DESKTOP
    mako &
    systemctl --user start ${pkgs.kdePackages.polkit-kde-agent-1}/libexec/polkit-kde-authentication-agent-1 &
    waybar &
    ${pkgs.hyprsunset}/bin/hyprsunset -t 4500 &
    ${pkgs.sway-audio-idle-inhibit}/bin/sway-audio-idle-inhibit &
  '';
in {
  config = mkIf config.hyprland.enable {
    home.packages = [
      inputs.niqspkgs.packages.x86_64-linux.bibata-hyprcursor
    ];

    home.sessionVariables.NIXOS_OZONE_WL = "1";

    wayland.windowManager.hyprland.settings = {
      exec-once = ''${startupScript}/bin/start'';

      monitor = monitors.configuration;

      input = {
        kb_layout = "us,us";
        kb_variant = "colemak,";
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

        "col.inactive_border" = "0xff${colors.base03}";
        "col.active_border" = "0xff${colors.base08}";
      };

      decoration = {
        rounding = "3";
      };
    };
  };
}
