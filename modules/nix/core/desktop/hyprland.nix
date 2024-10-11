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
  config = mkIf config.hyprland.enable {
    # Make Chromium + Eectron apps use Wayland
    environment.sessionVariables.NIXOS_OZONE_WL = "1";

    programs.hyprland = {
      enable = true;
      # Set package to version defined in the flake
      package = pkgs-unstable.hyprland;
      # Set portal package as well so that they are in sync
      portalPackage = pkgs-unstable.xdg-desktop-portal-hyprland;
    };
  };
}
