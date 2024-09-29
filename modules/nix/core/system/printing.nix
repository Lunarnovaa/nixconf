{
  pkgs,
  config,
  ...
}: {
  # Enabling CUPS to Print
  services.printing.enable = true;

  # Enabling Autodiscovery of Printers
  services.avahi = {
    enable = true;
    nssmdns4 = true;
    openFirewall = true;
  };
}
