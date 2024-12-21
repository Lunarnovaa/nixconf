{
  lib,
  config,
  ...
}: let
  inherit
    (lib)
    mkIf
    ;
  primaryDisplay = "HDMI-A-1";
  secondaryDisplay = "DP-4";
in {
  config = {
    profiles = {
      gaming = {
        enable = true;
      };
      server = {
        enable = false;
      };
      workstation = {
        enable = true;
      };
    };

    sysconf = {
      nvidia = true;
      verticalTabs = true;
    };

    loose = {
      fastfetch = false;
      spicetify = true;
      via = false;
    };

    hyprland = {
      enable = true;
      monitors = {
        configuration = [
          "${primaryDisplay}, preferred, auto, 1"
          #"${secondaryDisplay}, preferred, auto-left, 1"
          "${secondaryDisplay}, disable"
        ];
        bind = mkIf config.profiles.gaming.enable [
          #moves firefox workspace to secondary for gaming, primary when done
          #"$mod,B,moveworkspacetomonitor,1 ${secondaryDisplay}"
          #"$mod,K,moveworkspacetomonitor,1 ${primaryDisplay}"
        ];
        rules = [
          #"3, monitor:${primaryDisplay}"
          #"2, monitor:${secondaryDisplay}, default:true"
        ];
      };
    };
  };
}
