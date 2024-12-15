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
    programs.gamemode = {
      enable = true;
    };
  };
}
