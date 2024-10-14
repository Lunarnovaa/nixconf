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
  inherit
    (config.theme)
    colors
    ;
  pkgs-unstable = inputs.hyprland.packages.${pkgs.stdenv.hostPlatform.system};
  startupScript = pkgs.pkgs.writeShellScriptBin "start" ''
    mako &
    systemctl --user start ${pkgs.kdePackages.polkit-kde-agent-1}/libexec/polkit-kde-authentication-agent-1 &
    waybar &
  '';
  cursorTheme = "${pkgs.bibata-cursors}/share/icons/Bibata-Modern-Classic";
in {
  imports = [
    ./optionals/default.nix
    ./utils/default.nix
    ./binds.nix
    ./rules.nix
  ];

  config = mkIf config.hyprland.enable {
    home.sessionVariables.NIXOS_OZONE_WL = "1";
    wayland.windowManager.hyprland = {
      enable = true;
      # Set the hyprland package to the version defined in the flake
      package = pkgs-unstable.hyprland;

      settings = {
        exec-once = ''${startupScript}/bin/start'';

        input = {
          kb_layout = "us";
          kb_variant = "colemak";
          accel_profile = "flat";
          sensitivity = "-0.2";
        };

        env = [
          "HYPRCURSOR_THEME,${cursorTheme}"
          "HYPRCURSOR_SIZE,24"
        ];

        general = {
          border_size = "2";
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
  };
}
