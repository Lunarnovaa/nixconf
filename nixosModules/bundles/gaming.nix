{
  pkgs,
  lib,
  config,
  ...
}: {
  options = {
    gaming.enable =
      lib.mkEnableOption "enables gaming";
  };

  config = lib.mkIf config.gaming.enable {
    hardware.graphics.enable = true;

    programs.steam.enable = true;
    programs.steam.gamescopeSession.enable = true;
    programs.gamemode.enable = true;

    environment.systemPackages = with pkgs; [
      mangohud
      protonup
      lutris

      bottles

      steamtinkerlaunch

      vesktop

      prismlauncher

      rnnoise-plugin
    ];

    environment.sessionVariables = {
      STEAM_EXTRA_COMPAT_TOOLS_PATHS = "/home/lunarnova/.steam/root/compatibilitytools.d";
    };
  };
}
