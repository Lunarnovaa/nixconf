{
  lib,
  config,
  ...
}: let
  inherit (lib.options) mkEnableOption;
  inherit (lib.modules) mkIf mkDefault;

  cfg = config.profiles.server;
in {
  options.profiles.server = {
    enable = mkEnableOption ''
      the server modules. Currently this doesn't do much
      since I haven't delved into server stuff quite yet.
    '';
    services = {
      minecraft.enable = mkEnableOption ''
        the Minecraft Server to run on boot.
      '';
    };
  };
  config = mkIf cfg.enable {
    profiles.server.services.minecraft.enable = mkDefault true;
  };
}
