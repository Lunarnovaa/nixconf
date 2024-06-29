{
  pkgs,
  lib,
  config,
  ...
}: {

  options = {
    light-mode.enable =
      lib.mkEnableOption "enables light-mode";
  };

  config = lib.mkIf config.light-mode.enable {
    stylix = {
      base16Scheme = "${pkgs.base16-schemes}/share/themes/ayu-light.yaml";
      #https://tinted-theming.github.io/base16-gallery/
      cursor.name = "Bibata-Modern-Ice";
      image = ./wallpapers/light-mountains.jpg;
    };
  };
}