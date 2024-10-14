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
in {
  config = mkIf config.hyprland.enable {
    programs.mako = {
      enable = true;
      backgroundColor = "#${colors.base01}";
      textColor = "#${colors.base0E}";
      borderColor = "#${colors.base04}";
    };
  };
}
