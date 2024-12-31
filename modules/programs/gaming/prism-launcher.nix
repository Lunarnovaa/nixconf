{
  lib,
  config,
  pkgs,
  ...
}: let
  inherit (lib) mkIf;
  inherit (config.profiles) gaming;
  catppuccin-prism-launcher = pkgs.fetchFromGitHub {
    owner = "catppuccin";
    repo = "prismlauncher";
    rev = "2edbdf5295bc3c12c3dd53b203ab91028fce2c54";
    hash = "sha256-+yGrSZztf2sZ9frPT3ydIJDavo4eXs03cQWfdTAmn3w=";
  };
in {
  config = mkIf gaming.apps.minecraft {
    hjem.users.lunarnova = {
      packages = with pkgs; [prismlauncher];
      files = {
        ".local/share/PrismLauncher/themes/catppuccin-mocha/theme.json".source = "${catppuccin-prism-launcher}/themes/Mocha/theme.json";
        ".local/share/PrismLauncher/themes/catppuccin-mocha/themeStyle.css".source = "${catppuccin-prism-launcher}/themes/Mocha/themeStyle.css";
      };
    };
  };
}
