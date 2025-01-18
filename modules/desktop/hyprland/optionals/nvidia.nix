{
  config,
  lib,
  ...
}: let
  inherit (lib.modules) mkIf;
  inherit (lib.extendedLib.generators) toHyprconf;
in {
  config = mkIf (config.hyprland.enable && config.sysconf.nvidia) {
    hjem.users.lunarnova.files.".config/hypr/hyprland.conf".text = toHyprconf {
      attrs = {
        env = [
          "LIBVA_DRIVER_NAME,nvidia"
          "XDG_SESSION_TYPE,wayland"
          "GBM_BACKEND,nvidia-drm"
          "__GLX_VENDOR_LIBRARY_NAME,nvidia"
        ];
      };
    };
  };
}
