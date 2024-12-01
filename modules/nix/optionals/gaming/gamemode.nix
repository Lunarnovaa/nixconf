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
    programs.gamemode = {
      enable = true;
    };
  };
}
