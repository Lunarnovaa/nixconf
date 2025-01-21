{lib, ...}: let
  inherit (lib.options) mkOption;
  inherit (lib.types) bool listOf str attrs;
in {
  options.hyprland = {
    enable = mkOption {
      type = bool;
      default = false;
      description = "Whether to enable hyprland modules";
    };
    settings = mkOption {
      type = attrs;
      example = {
        "$mod" = "$super";
        decoration = {
          rounding = "3";
        };
      };
      description = ''
        Settings for hyprland wayland compositor to be
        written to the config file.
      '';
    };
    monitors = {
      configuration = mkOption {
        type = listOf str;
        default = [
          ", preferred, auto, 1"
        ];
        example = [
          "HDMI-A-1, 1920x1080@60, auto, 1"
          "DP-4, 1920x1080@60, auto-left, 1"
        ];
        description = "Monitor configurations for hyprland";
      };
      bind = mkOption {
        type = listOf str;
        default = [];
        description = "Sets special 'bind' binds for monitor configuration";
      };
      rules = mkOption {
        type = listOf str;
        default = [];
        example = [
          "3, monitor:HDMI-A-1"
          "2, monitor:DP-4, default:true"
        ];
        description = "Sets workspace rules for monitors";
      };
    };
    smartgaps = {
      enable = mkOption {
        type = bool;
        default = false;
        description = "Whether to enable smartgaps for hyprland.";
      };
    };
  };
}
