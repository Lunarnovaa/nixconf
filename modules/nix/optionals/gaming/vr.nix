{
  config,
  lib,
  ...
}: let
inherit (lib)
mkIf
;
in {
  config = mkIf (config.profile.gaming.enable && config.vr.enable) {
    /*services.wivrn = {
      enable = true;
      openFirewall = true;
      defaultRuntime = true;
      config = {
        enable = true;
        json = {
          encoders = [
            {
              encoder = "nvenc";
              codec = 
            }
          ];
          application = ["steam" "steam://launch/275850/VR"];
        };
      };
    };*/
  };
}