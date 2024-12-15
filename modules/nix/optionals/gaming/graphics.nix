{
  config,
  lib,
  ...
}: let
  inherit
    (lib)
    mkIf
    ;
  inherit
    (config.profiles)
    gaming
    ;
in {
  config = mkIf gaming.enable {
    hardware.graphics = {
      enable = true;
      enable32Bit = true;
    };
  };
}
