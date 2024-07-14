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
      #two options at boot
      nvidiaBeta.configuration = {
        hardware.nvidia.package =
          config.boot.kernelPackages.nvidiaPackages.beta;
        environment.etc."specialisation".text = "nvidiaBeta";
        boot.kernelParams = ["nvidia.NVreg_EnableGpuFirmware=0"];
      };
      nvidiaStable.configuration = {
        hardware.nvidia.package =
          config.boot.kernelPackages.nvidiaPackages.stable;
        environment.etc."specialisation".text = "nvidiaStable";
      };
    };

    hardware.nvidia = {
      modesetting.enable = true;

      open = false;

      nvidiaSettings = true; #accessible via nvidia-settings

      # package = config.boot.kernelPackages.nvidiaPackages.beta; #currently 555
      # package = config.boot.kernelPackages.nvidiaPackages.stable; #switch when 560
    };

    #kernel parameter for wayland on kde w explicit sync https://github.com/NVIDIA/open-gpu-kernel-modules/issues/538
  };
}
