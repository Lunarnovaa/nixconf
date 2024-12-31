{
  lib,
  config,
  inputs,
  ...
}: let
  inherit (lib.options) mkOption;
  inherit (lib.types) attrs str int path;
in {
  options.theme = {
    colors = mkOption {
      type = attrs;
      default = inputs.basix.schemeData.base24.catppuccin-mocha.palette;
      description = ''
        Defines a set of attributes for colors.
        Default is in base24 however any labeling and definitions will work.
      '';
    };
    fonts = {
      # Emoji font is declared within other font types rather than on its own to
      sans-serif = mkOption {
        type = str;
        default = "Inter";
        description = "Defines the sans-serif font";
      };
      serif = mkOption {
        type = str;
        default = "Roboto Serif";
        description = "Defines the serif font";
      };
      monospace = mkOption {
        type = str;
        default = "Fira Code Nerdfont";
        description = "Defines the monospace font";
      };
      emoji = mkOption {
        type = str;
        default = "Noto Color Emoji";
        description = "Defines the emoji font";
      };
      size = mkOption {
        type = int;
        default = 11;
        description = "Defines the font-size";
      };
    };
    wallpapers = {
      primary = mkOption {
        type = path;
        default = "${config.hjem.users.lunarnova.directory}/wallpapers/nauragarden.png";
        description = "Defines the primary wallpaper";
      };
    };
  };
}
