{
  lib,
  config,
  ...
}: let
  inherit (lib.options) mkOption;
  inherit (lib.types) bool;
in {
  options.profiles.gaming = {
    enable = mkOption {
      type = bool;
      default = false;
      description = ''
        Enables the gaming modules. By default, this enables special
        driver and DE configuration related to gaming, and enables
        apps related to gaming.
      '';
    };
    apps = {
      discord = mkOption {
        type = bool;
        default = config.profiles.gaming.enable;
        description = "Enables the Discord module";
      };
      lutris = mkOption {
        type = bool;
        default = config.profiles.gaming.enable; # Enabled by gaming profile
        description = "Enables the Lutris module";
      };
      minecraft = mkOption {
        type = bool;
        default = config.profiles.gaming.enable;
        description = "Enables the Minecraft module, installing Prism-Launcher";
      };
      obs = mkOption {
        type = bool;
        default = false;
        description = "Enables the OBS module";
        # OBS is not enabled by default because its usecase is
        # rather niche.
      };
      steam = mkOption {
        type = bool;
        default = config.profiles.gaming.enable;
        description = "Enables the Steam module";
      };
      vr = mkOption {
        type = bool;
        default = false; # Disabled by default due to higher performance requirements
        description = "Enables the VR module";
      };
    };
  };
}
