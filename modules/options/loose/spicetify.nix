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
    spicetify.enable =
      mkEnableOption "enables spicetify";
  };
}
