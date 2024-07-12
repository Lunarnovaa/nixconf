{
  inputs,
  lib,
  config,
  pkgs,
  ...
}: {
  options = {
    spotify.enable =
      lib.mkEnableOption "enables spotify";
  };

  config = lib.mkIf config.spotify.enable {
    services.spotifyd = {
      enable = true;
      settings = {
        username = "Lunarnova";
        #device_name = "${config.networking.hostName}";
        device_type = "desktop";
      };
    };
    home.packages = with pkgs; [
      spotify-qt
    ];
  };
}
