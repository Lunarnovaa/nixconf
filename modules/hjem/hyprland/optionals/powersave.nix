{
  config,
  lib,
  ...
}: let
  inherit (lib) mkIf mkForce toHyprconf;
in {
  config = mkIf (config.hyprland.enable && config.sysconf.powersave) {
    homes.lunarnova.files.".config/hypr/hyprland.conf" = {
      clobber = true;
      text = (toHyprconf { attrs = { 
        decoration = {
          blur.enabled = false;
          shadow.enabled = false;
        };
        misc.vfr = true;
      };});
    };
    homes.lunarnova.files.".config/hypr/hyprpaper.conf" = {
      clobber = true;
      text = (toHyprconf { attrs = { 
        ipc = mkForce false;
      };});
    };
  };
}
