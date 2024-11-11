{lib, ...}: let
  inherit
    (lib)
    mkEnableOption
    mkDefault
    ;
in {
  options = {
    bottom.enable =
      mkEnableOption "enables bottom";
  };

  config.bottom.enable = mkDefault true;
}
