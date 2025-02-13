{
  lib,
  config,
  ...
}: let
  inherit (lib.options) mkEnableOption;
  inherit (lib.modules) mkIf mkDefault;
in {
  options.profiles.server = {
    enable = mkEnableOption ''
      the server modules. Currently this doesn't do much
      since I haven't delved into server stuff quite yet.
    '';
    services = {
      minecraft = mkEnableOption ''
        the Minecraft Server to run on boot.
      '';
    };
  };
  config = mkIf config.profiles.server.enable {
    profiles.server.services.minecraft = mkDefault true;
  };
}
