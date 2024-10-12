{
  pkgs,
  config,
  ...
}: {
  # Enable Networking
  networking.networkmanager.enable = true;
  hardware.bluetooth.enable = true;
  networking.firewall = {
    enable = true;
    allowedTCPPorts = [25565];
  };
}
