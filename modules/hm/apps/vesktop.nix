{
  inputs,
  lib,
  config,
  pkgs,
  ...
}: let
  inherit
    (lib)
    mkIf
    ;
  # Referenced from NotAShelf/nyx, fetching css file directly as opposed to importing the import of this style sheet :)
  catppuccin-macchiato-css = pkgs.fetchurl {
    url = "https://catppuccin.github.io/discord/dist/catppuccin-macchiato.theme.css";
    sha256 = "1281n61bmhsvfn3dd4p9dpn3ijb98a4imi7041mhn764nnczs8y0";
  };
in {
  config = mkIf config.vesktop.enable {
    home.packages = with pkgs; [vesktop];
    xdg.configFile = {
      "vesktop/themes/catppuccin-macchiato.css".source = catppuccin-macchiato-css;
    };
  };
}
