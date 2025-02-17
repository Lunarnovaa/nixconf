{
  config,
  pkgs,
  theme,
  ...
}: let
  inherit (theme) fonts;

  cfg = config.hjem.users.lunarnova.rum.gtk;
in {
  hjem.users.lunarnova.rum.gtk = {
    enable = true;
    darkTheme = true;
    theme = {
      name = "catppuccin-mocha-rosewater-standard+normal";
      package = pkgs.catppuccin-gtk.override {
        accents = ["rosewater"];
        variant = "mocha";
        size = "standard";
        tweaks = ["normal"];
      };
    };
    iconTheme = {
      name = "Papirus-Dark";
      package = pkgs.catppuccin-papirus-folders.override {
        accent = "red";
        flavor = "mocha";
      };
    };
    font = {
      name = fonts.sans.name;
      size = fonts.size;
    };
    cursorTheme = {
      name = "Bibata-Modern-Classic";
      package = pkgs.bibata-cursors;
    };
  };

  environment.sessionVariables = {
    GTK2_RC_FILES = "${config.hjem.users.lunarnova.directory}/.gtkrc-2.0";
    GTK_THEME = cfg.theme.name;
  };
}
