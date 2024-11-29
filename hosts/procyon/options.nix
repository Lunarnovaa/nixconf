{...}: let
  primaryDisplay = "eDP-1";
in {
  imports = [
    ./../../modules/options/default.nix
  ];
  profile = {
    gaming.enable = false;
    server.enable = false;
    workstation.enable = true;
  };

  performance.enable = true;

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
