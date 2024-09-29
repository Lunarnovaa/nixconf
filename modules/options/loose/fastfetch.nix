{
  lib,
  config,
  ...
}: let
  inherit
    (lib)
    mkEnableOption
    ;
in {
  options = {
    fastfetch.enable =
      mkEnableOption "enables fastfetch";
  };
}
