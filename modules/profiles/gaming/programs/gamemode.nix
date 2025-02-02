{
  config,
  lib,
  ...
}: let
  inherit (lib.modules) mkIf;
  inherit (config.profiles) gaming;
in {
  config = mkIf gaming.enable {
    programs.gamemode = {
      enable = true;
    };
  };
}
