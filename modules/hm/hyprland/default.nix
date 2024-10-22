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
<<<<<<< HEAD
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
in {
  imports = [
    ./apps/default.nix
    ./optionals/default.nix
    ./utils/default.nix
    ./binds.nix
    ./rules.nix
  ];

  config = mkIf config.hyprland.enable {
    home.packages = [pkgs.bibata-cursors];
    home.sessionVariables.NIXOS_OZONE_WL = "1";
=======
  pkgs-unstable = inputs.hyprland.packages.${pkgs.stdenv.hostPlatform.system};
in {
  imports = [
    ./binds.nix
    ./mako.nix
    ./nvidia.nix
    ./tofi.nix
  ];

  config = mkIf config.hyprland.enable {
>>>>>>> ab118f5 (init: hyprland)
    wayland.windowManager.hyprland = {
      enable = true;
      # Set the hyprland package to the version defined in the flake
      package = pkgs-unstable.hyprland;

      settings = {
<<<<<<< HEAD
        exec-once = ''${startupScript}/bin/start'';
=======
        exec-once = ''
          mako & systemctl --user start ${pkgs.kdePackages.polkit-kde-agent-1}/libexec/polkit-kde-authentication-agent-1
        '';
>>>>>>> ab118f5 (init: hyprland)

        input = {
          kb_layout = "us";
          kb_variant = "colemak";
          accel_profile = "flat";
          sensitivity = "-0.2";
        };
<<<<<<< HEAD

        env = [
          "XCURSOR_THEME,Bibata-Modern-Classic"
          "XCURSOR_SIZE,24"
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
=======
>>>>>>> ab118f5 (init: hyprland)
      };
    };
  };
}
