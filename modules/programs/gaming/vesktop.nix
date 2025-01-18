{
  lib,
  config,
  pkgs,
  ...
}: let
  inherit (lib) mkIf;
  inherit (config.profiles) gaming;
  # Referenced from NotAShelf/nyx, fetching css file directly as opposed to importing the import of this style sheet :)
  catppuccin-mocha-css = pkgs.fetchurl {
    url = "https://catppuccin.github.io/discord/dist/catppuccin-mocha.theme.css";
    sha256 = "0vnvzb8gb1dk9ld80mik1avvqbiklbkd6r88gqpfcx779y8dcffi";
  };
in {
  config = mkIf gaming.apps.discord {
    hjem.users.lunarnova = {
      packages = with pkgs; [vesktop];
      files = {
        ".config/vesktop/themes/catppuccin-mocha.css".source = catppuccin-mocha-css;
      };
    };
  };
}
