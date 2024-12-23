{
  config,
  pkgs,
  ...
}: let
  catppuccin-spotify-player = pkgs.fetchFromGitHub {
    owner = "catppuccin";
    repo = "spotify-player";
    rev = "34b3d23806770185b72466d777853c73454b85a6";
    hash = "sha256-eenf1jB8b2s2qeG7wAApGwkjJZWVNzQj/wEZMUgnn5U=";
  };
  toTOML = (pkgs.formats.toml {}).generate;
in {
  homes.lunarnova = {
    packages = with pkgs; [spotify-player];
    files = {
      ".config/spotify-player/app.toml".source = (toTOML "spotify-player config" {
        client_id_command = "cat ${config.age.secrets.spotifyClientID.path}";
        device = {
          name = "${config.networking.hostName}";
          device_type = "computer";
          volume = 40;
          normalization = true;
          theme = "Catppuccin-macchiato";
        };
      });
      ".config/spotify-player/theme.toml".source = "${catppuccin-spotify-player}/theme.toml";
    };
  };
}
