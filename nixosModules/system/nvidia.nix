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
    # Use Beta Driver by default - Currently 560
    hardware.nvidia.package =
      config.boot.kernelPackages.nvidiaPackages.beta;

    specialisation = {
      # Boot option for Production Driver - Currently 550
      nvidiaProduction.configuration = {
        hardware.nvidia.package =
          config.boot.kernelPackages.nvidiaPackages.production;
        environment.etc."specialisation".text = "nvidiaProduction";
      };
    };

    hardware.nvidia = {
      modesetting.enable = true;
      nvidiaSettings = true; #accessible via nvidia-settings
    };

    # Firefox currently crashes when using Wayland
    environment.sessionVariables.MOZ_ENABLE_WAYLAND = "0";
  };
}
