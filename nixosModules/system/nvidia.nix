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
    hardware.nvidia.package =
      config.boot.kernelPackages.nvidiaPackages.production; #use production by default

    specialisation = {
      # Boot option for Beta Driver - Currently 555
      nvidiaBeta.configuration = {
        hardware.nvidia.package =
          config.boot.kernelPackages.nvidiaPackages.beta;
        environment.etc."specialisation".text = "nvidiaBeta";
        boot.kernelParams = ["nvidia.NVreg_EnableGpuFirmware=0"];
      };
    };

    hardware.nvidia = {
      modesetting.enable = true;

      open = false;

      nvidiaSettings = true; #accessible via nvidia-settings
    };
  };
}
