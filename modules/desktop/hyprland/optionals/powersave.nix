{
  config,
  lib,
  ...
}: let
  inherit (lib) mkIf;
  inherit (lib.extendedLib.generators) toHyprconf;
in {
  config = mkIf (config.hyprland.enable && config.sysconf.powersave) {
    hjem.users.lunarnova.files = {
      ".config/hypr/hyprland.conf".text = toHyprconf {
        attrs = {
          decoration = {
            blur.enabled = false;
            shadow.enabled = false;
          };
          misc.vfr = true;
        };
      };

      /*
      ".config/hypr/hyprpaper.conf".text = toHyprconf {
        attrs = {
          ipc = mkForce false;
        };
      };
      */
    };
  };
}
