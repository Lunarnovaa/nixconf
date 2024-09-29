{
  pkgs,
  config,
  ...
}: {
  # Configuring the Bootloader
  boot.loader = {
    systemd-boot = {
      enable = true;
    };
    efi = {
      canTouchEfiVariables = true;
    };
  };
}
