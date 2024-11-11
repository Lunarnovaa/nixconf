{
  lib,
  config,
  pkgs,
  ...
}: let
  inherit
    (lib)
    mkIf
    ;
  catppuccin-prism-launcher = pkgs.fetchFromGitHub {
    owner = "catppuccin";
    repo = "prismlauncher";
    rev = "2edbdf5295bc3c12c3dd53b203ab91028fce2c54";
    hash = "sha256-+yGrSZztf2sZ9frPT3ydIJDavo4eXs03cQWfdTAmn3w=";
  };
in {
  config = mkIf config.profile.gaming.enable {
    home = {
      packages = with pkgs; [prismlauncher];
      file = {
        ".local/share/PrismLauncher/themes/catppuccin-macchiato/theme.json".source = "${catppuccin-prism-launcher}/themes/Macchiato/theme.json";
        ".local/share/PrismLauncher/themes/catppuccin-macchiato/themeStyle.css".source = "${catppuccin-prism-launcher}/themes/Macchiato/themeStyle.css";
      };
    };
  };
}
