{
  pkgs,
  inputs,
  ...
}: {
  boot.loader = {
    grub = {
      enable = true;
      useOSProber = true;
      device = "/dev/nvme0n1";
      efiSupport = true;
    };
    efi = {
      canTouchEfiVariables = true;
      efiSysMountPoint = "/boot";
    };
  };
}
