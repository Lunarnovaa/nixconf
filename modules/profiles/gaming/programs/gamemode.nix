{
  config,
  lib,
  ...
}: let
  inherit (lib.modules) mkIf;

  cfg = config.profiles.gaming;
in {
  config = mkIf cfg.enable {
    programs.gamemode = {
      enable = true;
    };
  };
}
