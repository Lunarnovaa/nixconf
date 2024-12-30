{
  lib,
  config,
  ...
}: let
  inherit (lib) mkIf mkForce;
  primaryDisplay = "HDMI-A-1";
  secondaryDisplay = "DP-4";
in {
  imports = [
    ./hardware-configuration.nix
  ];
  # Defining the Hostname
  networking.hostName = "polaris";

  specialisation = {
    # "Focus Mode": Disables Gaming Modules
    focusMode.configuration = {
      environment.etc."specialisation".text = "focusMode";
      profiles.gaming.enable = mkForce false;
    };
    # "Cosmic Session": Enables Cosmic DE
    cosmicSession.configuration = {
      environment.etc."specialisation".text = "cosmicSession";
      cosmic.enable = mkForce true;
      hyprland.enable = mkForce false;
    };
  };

  # Custom option definitions
  profiles = {
    gaming = {
      enable = true;
      apps.obs = false;
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

  cosmic =  {
    enable = false;
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
}
