{
  lib,
  config,
  ...
}: let
  inherit (lib.options) mkOption;
  inherit (lib.types) bool;
in {
  options.profiles.server = {
    enable = mkOption {
      type = bool;
      default = false;
      description = ''
        Enables the server modules. Currently this doesn't do much
        since I haven't delved into server stuff quite yet.
      '';
    };
    services = {
      minecraft = mkOption {
        type = bool;
        default = config.profiles.server.enable;
        description = ''
          Enables the Minecraft-Server service to start up on boot.
        '';
      };
    };
  };
}
