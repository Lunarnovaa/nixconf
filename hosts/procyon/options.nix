{...}: let
  primaryDisplay = "eDP-1";
in {
  imports = [
    ./../../modules/options/default.nix
  ];

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
