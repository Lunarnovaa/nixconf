{
  lib,
  config,
  inputs,
  pkgs,
  ...
}: let
  inherit (lib.options) mkOption mkPackageOption;
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
      monospace = {
        package = mkPackageOption pkgs ["nerd-fonts" "fira-code"] {}; #defaults to nerd-fonts.fira-code
        name = mkOption {
          type = str;
          default = "Fira Code Nerdfont";
          description = "Defines the monospace font";
        };
      };

      sans = {
        package = mkPackageOption pkgs "inter" {};
        name = mkOption {
          type = str;
          default = "Inter";
          description = "Defines the sans font";
        };
      };

      serif = {
        package = mkPackageOption pkgs "roboto-serif" {};
        name = mkOption {
          type = str;
          default = "Roboto Serif";
          description = "Defines the serif font";
        };
      };

      emoji = {
        package = mkPackageOption pkgs "noto-fonts-color-emoji" {};
        name = mkOption {
          type = str;
          default = "Noto Color Emoji";
          description = "Defines the emoji font";
        };
      };

      cjk = {
        sans = {
          package = mkPackageOption pkgs "noto-fonts-cjk-sans" {};
          name = mkOption {
            type = str;
            default = "Noto Sans CJK SC";
            description = "Defines the CJK sans font";
          };
        };
        serif = {
          package = mkPackageOption pkgs "noto-fonts-cjk-serif" {};
          name = mkOption {
            type = str;
            default = "Noto Serif CJK SC";
            description = "Defines the CJK serif font";
          };
        };
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

  config.theme.fonts.monospace = {
    package = inputs.ioshelfka.packages.x86_64-linux.ioshelfka-mono-nerd;
    name = "Ioshelfka Mono Nerdfont";
  };
}
