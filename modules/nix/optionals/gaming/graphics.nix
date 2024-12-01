{
  config,
  lib,
  ...
}: let
  inherit
    (lib)
    mkIf
    ;
in {
  config = mkIf config.profile.gaming.enable {
    hardware.graphics = {
      enable = true;
      enable32Bit = true;
    };
  };
}
