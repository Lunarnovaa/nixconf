{
  config,
  lib,
  pkgs,
  ...
}: let
  inherit (lib) mkIf;
  inherit (config.profiles) gaming;
in {
  config = mkIf gaming.apps.steam {
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
