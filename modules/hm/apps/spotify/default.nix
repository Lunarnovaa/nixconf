{osConfig, ...}: {
  imports = [
    ./spicetify.nix
  ];

  services.spotifyd = {
    enable = true;
    settings = {
      global = {
        username = "Lunarnova";
        password_cmd = "cat ${osConfig.age.secrets.spotifyPassword.path}";
        device_name = "${osConfig.networking.hostName}";
        initial_volume = "40";
      };
    };
  };

  programs.spotify-player = {
    enable = true;
  };
}
