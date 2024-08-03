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
    # Use Production Driver by default - Currently 550
    hardware.nvidia.package =
      config.boot.kernelPackages.nvidiaPackages.production;

    specialisation = {
      # Boot option for Beta Driver - Currently 560
      nvidiaBeta.configuration = {
        hardware.nvidia.package =
          config.boot.kernelPackages.nvidiaPackages.beta;
        environment.etc."specialisation".text = "nvidiaBeta";
      };
    };

    hardware.nvidia = {
      modesetting.enable = true;
      nvidiaSettings = true; #accessible via nvidia-settings
      open = false;
    };
  };
}
