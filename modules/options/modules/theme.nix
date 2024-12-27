{
  lib,
  config,
  ...
}: let
  inherit (lib.options) mkOption;
  inherit (lib.types) attrs str int path;
in {
  options.theme = {
    colors = mkOption {
      type = attrs;
      default = {
        # Credit for this conversion can be found here https://github.com/tinted-theming/schemes/pull/33
        base00 = "24273a"; # base
        base01 = "1e2030"; # mantle
        base02 = "363a4f"; # surface0
        base03 = "494d64"; # surface1
        base04 = "5b6078"; # surface2
        base05 = "cad3f5"; # text
        base06 = "f4dbd6"; # rosewater
        base07 = "b7bdf8"; # lavender
        base08 = "ed8796"; # red
        base09 = "f5a97f"; # peach
        base0A = "eed49f"; # yellow
        base0B = "a6da95"; # green
        base0C = "8bd5ca"; # teal
        base0D = "8aadf4"; # blue
        base0E = "c6a0f6"; # mauve
        base0F = "f0c6c6"; # flamingo
        base10 = "1e2030"; # mantle - darker background
        base11 = "181926"; # crust - darkest background
        base12 = "ee99a0"; # maroon - bright red
        base13 = "f4dbd6"; # rosewater - bright yellow
        base14 = "a6da95"; # green - bright green
        base15 = "91d7e3"; # sky - bright cyan
        base16 = "7dc4e4"; # sapphire - bright blue
        base17 = "f5bde6"; # pink - bright purple
      };
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
        default = "${config.homes.lunarnova.directory}/wallpapers/nauragarden.png";
        description = "Defines the primary wallpaper";
      };
    };
  };
}
