{
  pkgs,
  config,
  ...
}: {
  # Enable Networking
  networking = {
    networkmanager = {
      enable = true;
      ensureProfiles = {
        environmentFiles = [
          config.age.secrets.wifiPassword.path
        ];
        profiles = {
          aquacell = {
            connection = {
              id = "Aquacell 5G";
              type = "wifi";
              autoconnect = true;
            };
            ipv4.method = "auto";
            wifi = {
              ssid = "Aquacell 5G";
            };
            wifi-security = {
              key-mgmt = "wpa-psk";
              psk = "$psk_Aquacell5G";
            };
          };
          ethernet = {
            connection = {
              id = "Ethernet";
              type = "ethernet";
              autoconnect = true;
            };
            ipv4.method = "auto";
          };
        };
      };
    };
    firewall = {
      enable = true;
      allowedTCPPorts = [25565];
    };
  };
  #Enable Bluetooth
  hardware.bluetooth.enable = true;
}
