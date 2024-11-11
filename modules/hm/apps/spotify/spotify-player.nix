{
  osConfig,
  pkgs,
  ...
}: let
  catppuccin-spotify-player = pkgs.fetchFromGitHub {
    owner = "catppuccin";
    repo = "spotify-player";
    rev = "34b3d23806770185b72466d777853c73454b85a6";
    hash = "sha256-eenf1jB8b2s2qeG7wAApGwkjJZWVNzQj/wEZMUgnn5U=";
  };
in {
  programs.spotify-player = {
    enable = true;
    settings = {
      client_id_command = "cat ${osConfig.age.secrets.spotifyClientID.path}";
      device = {
        name = "${osConfig.networking.hostName}";
        device_type = "computer";
        volume = 40;
        normalization = true;
        theme = "Catppuccin-macchiato";
      };
    };
  };
  xdg.configFile = {
    "spotify-player/theme.toml".source = "${catppuccin-spotify-player}/theme.toml";
  };
}
