{
  config,
  pkgs,
  lib,
  ...
}: let
  inherit (lib) generators isBool boolToString isString escape concatMapStrings mapAttrsToList;
  inherit (config.theme) fonts;

  # toGtk3Ini , formatGtk2Option , and finalGtk2Text are all taken from https://github.com/nix-community/home-manager
  # They are all available under the MIT License.
  toGtk3Ini = generators.toINI {
    mkKeyValue = key: value:
      let value' = if isBool value then boolToString value else toString value;
      in "${escape [ "=" ] key}=${value'}";
  };
  formatGtk2Option = n: v:
    let
      v' = if isBool v then
        boolToString v
      else if isString v then
        ''"${v}"''
      else
        toString v;
    in "${escape [ "=" ] n} = ${v'}";
  finalGtk2Text =  concatMapStrings (l: l + "\n") (mapAttrsToList formatGtk2Option gtk-settings);
  # End of Copy
  # End of availability under MIT License.

  gtk-settings = {
    gtk-icon-theme-name = "Papirus-Dark";

    gtk-theme-name = "catppuccin-macchiato-red-standard";

    gtk-font-name = "${fonts.sans-serif} ${builtins.toString fonts.size}";

    gtk-cursor-theme-name = "Bibata-Modern-Classic";

    gtk-application-prefer-dark-theme = true;
  };
in {
  homes.lunarnova = {
    files = {
      ".gtkrc-2.0".text = finalGtk2Text;
      ".config/gtk-3.0/settings.ini".text = (toGtk3Ini {
        Settings = gtk-settings;
      });
      ".config/gtk-4.0/settings.ini".text = (toGtk3Ini {
        Settings = gtk-settings;
      });
    };
    packages = with pkgs; [
      (catppuccin-gtk.override {
        accents = ["red"];
        variant = "macchiato";
      })
      (catppuccin-papirus-folders.override {
        accent = "red";
        flavor = "macchiato";
      })
      bibata-cursors
    ];
  };
}
