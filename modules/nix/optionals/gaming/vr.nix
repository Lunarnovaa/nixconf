{
  config,
  lib,
  pkgs,
  ...
}: let
inherit (lib)
mkIf
;
in {
  config = mkIf (config.profile.gaming.enable && config.vr.enable) {
    services.wivrn = {
      enable = true;

      # Opens firewall for wivrn to stream through wifi
      openFirewall = true;
      
      # Autostarts wivrn daemon
      autoStart = true;

      defaultRuntime = true;

      extraPackages = with pkgs; [
        # fixes crash with nvidia proprietary drivers
        monado-vulkan-layers
      ];
      
      config = {
        enable = true;
        json = {
          encoders = [
            {
              encoder = "nvenc";
              codec = "h265";
            }
          ];
        };
      };
    };
  };
}
