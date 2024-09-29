{
  pkgs,
  config,
  ...
}: {
  # Enable Networking
  networking.networkmanager.enable = true;
  hardware.bluetooth.enable = true;
}
