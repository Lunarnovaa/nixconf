{
  config,
  lib,
  ...
}: let
  inherit (lib.modules) mkIf;
in {
  config = mkIf (config.hyprland.enable && config.sysconf.powersave) {
    programs.hyprland.settings = {
      decoration = {
        blur.enabled = false;
        shadow.enabled = false;
      };
      misc.vfr = true;
    };
  };
}
