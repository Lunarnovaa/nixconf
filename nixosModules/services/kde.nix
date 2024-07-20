{
  pkgs,
  lib,
  config,
  ...
}: {
  options = {
    kde.enable =
      lib.mkEnableOption "enables kde";
  };

  config = lib.mkIf config.kde.enable {
    services.displayManager.sddm.enable = true;
    services.displayManager.sddm.wayland.enable = true;
    services.xserver.displayManager.sddm.wayland.enable = true;
    services.desktopManager.plasma6.enable = true;
  };
}
