{
  lib,
  config,
  ...
}: let
  inherit
    (lib)
    mkEnableOption
    mkDefault
    ;
in {
  options = {
    hyprland.enable =
      mkEnableOption "enables hyprland";
  };

  config = {
    hyprland.enable = mkDefault true;
  };
}
