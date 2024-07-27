{
  inputs,
  lib,
  config,
  pkgs,
  ...
}: {
  config = lib.mkIf config.desktop.enable {
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

    home.packages = with pkgs; [
      spotify
    ];
  };
}
