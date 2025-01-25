{
  config,
  lib,
  ...
}: let
  inherit (lib.modules) mkIf;
  inherit (lib.extendedLib.generators) toHyprconf;
in {
  config = mkIf (config.hyprland.enable && config.sysconf.powersave) {
    programs.hyprland.settings = {
      decoration = {
        blur.enabled = false;
        shadow.enabled = false;
      };
      misc.vfr = true;
    };

    /*
    ".config/hypr/hyprpaper.conf".text = toHyprconf {
      attrs = {
        ipc = mkForce false;
      };
    };
    */
  };
}
