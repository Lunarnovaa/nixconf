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
  inherit
    (config.theme)
    fonts
    ;
  #for some reason, the folks over at catppuccin/zed did not actually include the theme in .json in the source, so we fetch all the 4 main themes in with red accent from releases
  catppuccin = pkgs.pkgs.fetchurl {
    url = "https://github.com/catppuccin/zed/releases/download/0.2.11/catppuccin-red.json";
    sha256 = "01vkv24f3c406cn4hrsnnam2hkr7iqmpd51vli680a94j9x2jsid";
  };
  nixExtension = pkgs.pkgs.fetchFromGitHub {
    owner = "zed-extensions";
    repo = "nix";
    rev = "242631811daee74d5ee26be36a067e4033e88bd3";
    hash = "sha256-IMpyh6xlycUCVr7bmN3BjhuxksSxRiq5DB/XZMlipcM=";
  };
in {
  config = mkIf config.zed.enable {
    home.packages = with pkgs; [zed-editor];
    xdg.configFile = {
      "zed/settings.json".text = ''
        "buffer_font_family": "${fonts.monospace}"
        "buffer_font_size": "11"
        "theme": "Catppuccin Macchiato (red)"
      '';
      "zed/themes/catppuccin-macchiato-red.json".source = catppuccin;
      "zed/extensions/nix/".source = nixExtension;
    };
  };
}
