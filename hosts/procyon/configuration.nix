{lib, ...}: let
  inherit (lib) mkForce;
  primaryDisplay = "eDP-1";
in {
  imports = [
    ./hardware-configuration.nix
  ];
  # Defining the Hostname
  networking.hostName = "procyon";

  # Specialisation for "Gaming Mode": Enables Gaming Module
  specialisation = {
    gamingMode.configuration = {
      environment.etc."specialisation".text = "gamingMode";
      profiles.gaming.enable = mkForce true;
    };
  };

  # Custom option definitions
  profiles = {
    gaming = {
      enable = false;
      apps = {
      };
    };
    server = {
      enable = false;
      services = {
      };
    };
    workstation = {
      enable = true;
      apps = {
      };
    };
  };

  sysconf = {
    powersave = true;
  };

  hyprland = {
    enable = true;
    monitors = {
      configuration = [
        "${primaryDisplay}, preferred, auto, 1.333333"
      ];
      #bind = [];
      #rules = [];
    };
  };
}
