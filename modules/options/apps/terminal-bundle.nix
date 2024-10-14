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
    alacritty.enable =
      mkEnableOption "enables alacritty";
    nushell.enable =
      mkEnableOption "enables nushell";
    spaceship.enable =
      mkEnableOption "enables spaceship";
  };
  config = {
    alacritty.enable = mkDefault true;
    nushell.enable = mkDefault true;
    spaceship.enable = mkDefault true;
  };
}
