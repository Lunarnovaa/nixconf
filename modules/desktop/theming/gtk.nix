{
  config,
  pkgs,
  lib,
  ...
}: let
  inherit (config.theme) fonts;
  inherit (lib.extendedLib.generators.gtk) finalGtk2Text toGtk3Ini;
  inherit (builtins) toString;

  gtk-settings = {
    gtk-icon-theme-name = "Papirus-Dark";

    gtk-theme-name = "catppuccin-mocha-red-standard+normal";

    gtk-font-name = "${fonts.sans-serif} ${toString fonts.size}";

    gtk-cursor-theme-name = "Bibata-Modern-Classic";

    gtk-application-prefer-dark-theme = true;
  };

  gtk-theme-pkg = pkgs.catppuccin-gtk.override {
    accents = ["red"];
    variant = "mocha";
    size = "standard";
    tweaks = ["normal"];
  };
in {
  hjem.users.lunarnova = {
    files = {
      ".gtkrc-2.0".text = finalGtk2Text {attrs = gtk-settings;};
      ".config/gtk-3.0/settings.ini".text = toGtk3Ini {
        Settings = gtk-settings;
      };
      ".config/gtk-4.0/settings.ini".text = toGtk3Ini {
        Settings = gtk-settings;
      };
      ".config/gtk-4.0/gtk.css".source = "${gtk-theme-pkg}/share/themes/${gtk-settings.gtk-theme-name}/gtk-4.0/gtk-dark.css";
    };
    packages = [
      (pkgs.catppuccin-papirus-folders.override {
        accent = "red";
        flavor = "mocha";
      })
      pkgs.bibata-cursors
      gtk-theme-pkg
    ];
  };

  environment.sessionVariables = {
    GTK2_RC_FILES = "${config.hjem.users.lunarnova.directory}/.gtkrc-2.0";
    GTK_THEME = "${gtk-settings.gtk-theme-name}";
  };
}
