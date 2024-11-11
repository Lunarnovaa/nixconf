{lib, ...}: let
  inherit
    (lib.options)
    mkOption
    ;
  inherit
    (lib)
    mkEnableOption
    mkDefault
    ;
  inherit
    (lib.types)
    listOf
    str
    ;
in {
  options.hyprland = {
    enable = mkEnableOption "enables hyprland";
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
  };
  config.hyprland.enable = mkDefault true;
}
