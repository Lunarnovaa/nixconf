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
  config = mkIf config.loose.bottom {
    programs.bottom = {
      enable = true;
    };
  };
}
