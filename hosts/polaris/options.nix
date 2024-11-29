{
  lib,
  config,
  ...
}: let
  inherit
    (lib)
    mkDefault
    mkIf
    ;
  primaryDisplay = "HDMI-A-1";
  secondaryDisplay = "DP-4";
in {
  imports = [
    ./../../modules/options/default.nix
  ];
  config = {
    profile = {
      gaming.enable = mkDefault true;
      server.enable = mkDefault false;
      workstation.enable = mkDefault true;
    };

    # Note for setting options: if setting to true, can use mkDefault: simply set to false by default through mkEnableOption; if setting to false; use mkForce
    firefox-vertical-tabs.enable = mkDefault true;
    fastfetch.enable = mkDefault true;
    nvidia.enable = mkDefault true;
    spicetify.enable = mkDefault true;

    via.enable = mkDefault true;
    hyprland = {
      enable = true;
      monitors = {
        configuration = [
          "${primaryDisplay}, preferred, auto, 1"
          #"${secondaryDisplay}, preferred, auto-left, 1"
          "${secondaryDisplay}, disable"
        ];
        bind = mkIf config.profile.gaming.enable [
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
