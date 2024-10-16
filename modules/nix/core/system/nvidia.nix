{
  pkgs,
  lib,
  config,
  ...
}: {
  config = lib.mkIf config.nvidia.enable {
    services.xserver.videoDrivers = ["nvidia"];

    hardware.nvidia = {
      # Use Latest Driver by default - Currently 560.35
      package = config.boot.kernelPackages.nvidiaPackages.latest;

      modesetting.enable = true;
      nvidiaSettings = true; #accessible via nvidia-settings
      open = false; #suspend issues

      powerManagement.enable = true;
    };
    boot.kernelParams = ["nvidia.NVreg_PreserveVideoMemoryAllocations=1"];
  };
}
