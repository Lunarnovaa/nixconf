{
  lib,
  config,
  pkgs,
  ...
}: let
  inherit (lib) mkIf;
  inherit (config.profiles) gaming;
in {
  config = mkIf gaming.apps.obs {
    hjem.users.lunarnova = {
      packages = [
        (pkgs.wrapOBS {
          plugins = with pkgs.obs-studio-plugins; [
            wlrobs #for screen capture w/wayland, will be mandatory in future
            obs-vkcapture #vulkan/opengl game capture #ref https://github.com/nowrep/obs-vkcapture for game setup
            input-overlay #kb, contr, & mouse input
            obs-multi-rtmp #multi-site broadcast
            obs-mute-filter #improves muting capability for sources
            obs-livesplit-one #livesplit one source
            obs-pipewire-audio-capture
          ];
        })
      ];
    };
  };
}
