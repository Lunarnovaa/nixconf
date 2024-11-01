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
  pkgs-unstable = inputs.hyprland.packages.${pkgs.stdenv.hostPlatform.system};
in {
  imports = [
    ./apps/default.nix
    ./optionals/default.nix
    ./utils/default.nix
    ./binds.nix
    ./config.nix
    ./rules.nix
  ];

  config = mkIf config.hyprland.enable {
    wayland.windowManager.hyprland = {
      enable = true;
      # Set the hyprland package to the version defined in the flake
      package = pkgs-unstable.hyprland;
    };
  };
}
