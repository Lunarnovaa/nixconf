{
  config,
  lib,
  pkgs,
  ...
}: let
  inherit
    (lib)
    mkIf
    ;
in {
  config = mkIf config.profile.gaming.enable {
    programs.steam = {
      enable = true;
      gamescopeSession = {
        enable = true;
      };
    };
    environment = {
      sessionVariables = {
        STEAM_EXTRA_COMPAT_TOOLS_PATHS = "/home/lunarnova/.steam/root/compatibilitytools.d";
      };
      systemPackages = with pkgs; [
        protonup
      ];
    };
  };
}
