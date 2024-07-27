{
  pkgs,
  lib,
  config,
  inputs,
  ...
}: {
  imports = [
    ../system/x11.nix
  ];

  ##  KDE DESKTOP  ##
  services.displayManager.sddm.enable = true;
  services.displayManager.sddm.wayland.enable = true;
  services.xserver.displayManager.sddm.wayland.enable = true;
  services.desktopManager.plasma6.enable = true;
}
