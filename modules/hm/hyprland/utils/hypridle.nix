{
  lib,
  config,
  ...
}: let
  inherit (lib) mkIf;
in {
  config = mkIf config.hyprland.enable {
    services.hypridle = {
      enable = true;
      settings = {
        general = {
          lock_cmd = "pidof swaylock || swaylock";
          before_sleep_cmd = "swaylock";
          after_sleep_cmd = "hyprctl dispatch dpms on";
        };
        listener = [
          {
            timeout = 300; # 5 minute idle = screenlock
            on-timeout = "swaylock";
          }
          {
            timeout = 900; # 15 minute idle = monitor off
            on-timeout = "hyprctl dispatch dpms off";
            on-resume = "hyprctl dispatch dpms on";
          }
        ];
      };
    };
  };
}
