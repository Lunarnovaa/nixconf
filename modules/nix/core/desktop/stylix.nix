{
  pkgs,
  lib,
  config,
  ...
}: {
  stylix = {
    enable = true;

    base16Scheme = "${pkgs.base16-schemes}/share/themes/catppuccin-macchiato.yaml";
    #https://tinted-theming.github.io/base16-gallery/
    cursor.name = "Bibata-Modern-Classic";
    image = /home/lunarnova/wallpapers/nauragarden.png;
    #polarity = "dark";
    cursor.package = pkgs.bibata-cursors;
    cursor.size = 24;

    fonts = {
      sizes = {
        applications = 10;
        terminal = 12;
        desktop = 10;
        popups = 10;
      };
    };

    opacity = {
      applications = 1.0;
      terminal = 1.0;
      desktop = 1.0;
      popups = 1.0;
    };
  };
}
