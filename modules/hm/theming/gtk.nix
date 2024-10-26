{
  config,
  pkgs,
  ...
}: let
  inherit
    (config.theme)
    fonts
    ;
in {
  gtk = {
    enable = true;
    theme = {
      name = "catppuccin-macchiato-red-standard";
      package = pkgs.catppuccin-gtk.override {
        accents = ["red"];
        variant = "macchiato";
      };
    };

    iconTheme = {
      name = "Papirus-Dark";
      package = pkgs.catppuccin-papirus-folders.override {
        accent = "red";
        flavor = "macchiato";
      };
    };

    cursorTheme = {
      package = pkgs.bibata-cursors;
      name = "Bibata-Modern-Classic";
    };

    font = {
      name = fonts.sans-serif;
      size = fonts.size;
    };
    gtk3.extraConfig.gtk-application-prefer-dark-theme = true;
    gtk4.extraConfig.gtk-application-prefer-dark-theme = true;
  };
}
