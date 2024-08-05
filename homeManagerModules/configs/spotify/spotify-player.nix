{
  inputs,
  pkgs,
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
        #device_name = "${config.networking.hostName}";
        device_type = "computer";
      };
    };
  };

  programs.spotify-player = {
    enable = true;
  };
}
