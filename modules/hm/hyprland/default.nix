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
  pkgs-unstable = inputs.hyprland.packages.${pkgs.stdenv.hostPlatform.system};
  startupScript = pkgs.pkgs.writeShellScriptBin "start" ''
    mako &
    systemctl --user start ${pkgs.kdePackages.polkit-kde-agent-1}/libexec/polkit-kde-authentication-agent-1 &
    waybar &
  '';
in {
  imports = [
    ./options/default.nix
    ./utils/default.nix
    ./binds.nix
  ];

  config = mkIf config.hyprland.enable {
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

        general = {
          border_size = "2";
          gaps_out = "4,10,10,10";
          gaps_in = "4";
        };

        decoration = {
          rounding = "3";
        };
      };
    };
  };
}
