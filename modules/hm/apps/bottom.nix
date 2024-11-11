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
  config = mkIf config.bottom.enable {
    programs.bottom = {
      enable = true;
    };
  };
}
