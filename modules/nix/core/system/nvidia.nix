{
  pkgs,
  lib,
  config,
  ...
}: {
  options = {
    nvidia.enable =
      lib.mkEnableOption "enables nvidia";
  };

  config = lib.mkIf config.nvidia.enable {
    services.xserver.videoDrivers = ["nvidia"];
    # Use Latest Driver by default - Currently 560.35
    hardware.nvidia.package =
      config.boot.kernelPackages.nvidiaPackages.latest;

    hardware.nvidia = {
      modesetting.enable = true;
      nvidiaSettings = true; #accessible via nvidia-settings
      open = true;
    };
  };
}
