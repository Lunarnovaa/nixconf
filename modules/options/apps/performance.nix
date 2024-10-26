{lib, ...}: let
  inherit
    (lib)
    mkEnableOption
    ;
in {
  options = {
    performance.enable =
      mkEnableOption "enables performance mode";
  };
}
