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
in {
  imports = [
    ./binds.nix
    ./mako.nix
    ./nvidia.nix
    ./tofi.nix
  ];

  config = mkIf config.hyprland.enable {
    wayland.windowManager.hyprland = {
      enable = true;
      # Set the hyprland package to the version defined in the flake
      package = pkgs-unstable.hyprland;

      settings = {
        exec-once = ''
          mako & systemctl --user start ${pkgs.kdePackages.polkit-kde-agent-1}/libexec/polkit-kde-authentication-agent-1
        '';

        input = {
          kb_layout = "us";
          kb_variant = "colemak";
          accel_profile = "flat";
          sensitivity = "-0.2";
        };
      };
    };
  };
}
