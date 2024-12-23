{
  config,
  lib,
  ...
}: let
  inherit (lib) mkIf;
in {
  config = mkIf (config.hyprland.enable && config.sysconf.nvidia) {
    wayland.windowManager.hyprland.settings = {
      env = [
        "LIBVA_DRIVER_NAME,nvidia"
        "XDG_SESSION_TYPE,wayland"
        "GBM_BACKEND,nvidia-drm"
        "__GLX_VENDOR_LIBRARY_NAME,nvidia"
      ];
      cursor = {
        "no_hardware_cursors" = true;
      };
    };
  };
}
