{
  lib,
  config,
  ...
}: let
  inherit (lib.options) mkEnableOption;
  inherit (lib.modules) mkDefault mkIf;
in {
  options.profiles.gaming = {
    enable = mkEnableOption ''
      the gaming modules. By default, this enables special
      driver and DE configuration related to gaming, and enables
      apps related to gaming.
    '';
    apps = {
      discord = mkEnableOption ''
        Discord.
      '';
      lutris = mkEnableOption ''
        Lutris.
      '';
      minecraft = mkEnableOption ''
        Minecraft, installing Prism-Launcher.
      '';
      obs = mkEnableOption ''
        "Open Broadcast Software."
      ''; # OBS is not enabled by default.
      steam = mkEnableOption ''
        Steam.
      '';
      vr = mkEnableOption ''
        VR.
      ''; # VR is not enabled by default.
    };
  };
  config = mkIf config.profiles.gaming.enable {
    profiles.gaming.apps = {
      discord = mkDefault true;
      lutris = mkDefault true;
      minecraft = mkDefault true;
      steam = mkDefault true;
    };
  };
}
