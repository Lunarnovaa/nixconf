{lib, ...}: let
  inherit
    (lib)
    mkEnableOption
    ;
in {
  options = {
    via.enable =
      mkEnableOption "enables via udev and app";
  };
}
