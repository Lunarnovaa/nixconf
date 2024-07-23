{
  pkgs,
  lib,
  config,
  ...
}: {
  options = {
    x11.enable =
      lib.mkEnableOption "enables x11";
  };

  config = lib.mkIf config.x11.enable {
    services.xserver.enable = true;
    services.displayManager.sddm.wayland.enable = lib.mkForce false;
    services.xserver.displayManager.sddm.wayland.enable = lib.mkForce false;
    services.xserver.displayManager.defaultSession = "plasmax11";
  };
}
