{
  lib,
  config,
  pkgs,
  ...
}: let
  inherit (lib) mkIf;
  inherit (config.profiles) gaming;
  # Referenced from NotAShelf/nyx, fetching css file directly as opposed to importing the import of this style sheet :)
  catppuccin-macchiato-css = pkgs.fetchurl {
    url = "https://catppuccin.github.io/discord/dist/catppuccin-macchiato.theme.css";
    sha256 = "1281n61bmhsvfn3dd4p9dpn3ijb98a4imi7041mhn764nnczs8y0";
  };
in {
  config = mkIf gaming.apps.discord {
    homes.lunarnova = {
      packages = with pkgs; [vesktop];
      files = {
        ".config/vesktop/themes/catppuccin-macchiato.css".source = catppuccin-macchiato-css;
      };
    };
  };
}
