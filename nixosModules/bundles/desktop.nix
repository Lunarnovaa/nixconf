{
  pkgs,
  lib,
  config,
  inputs,
  ...
}: {
  ##  COSMIC DESKTOP  ##
  services.desktopManager.cosmic.enable = true;
  services.displayManager.cosmic-greeter.enable = true;
}
