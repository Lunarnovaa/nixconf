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
        global = {
          username = "Lunarnova";
          #device_name = "${config.networking.hostName}";
          device_type = "computer";
        };
      };
    };

    programs.spotify-player = {
      enable = true;
    };
    # Enables the standard Spotify Client primarily for making playlists
    home.packages = [pkgs.spotify];
  };
}
