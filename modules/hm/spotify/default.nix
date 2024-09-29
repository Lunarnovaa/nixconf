{
  inputs,
  pkgs,
  osConfig,
  ...
}: {
  imports = [
    ./spicetify.nix
  ];

  services.spotifyd = {
    enable = true;
    settings = {
      global = {
        username = "Lunarnova";
        device_name = "${osConfig.networking.hostName}";
      };
    };
  };

  programs.spotify-player = {
    enable = true;
  };
}
