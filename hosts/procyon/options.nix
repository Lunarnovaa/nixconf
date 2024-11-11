{lib, ...}: let
  inherit
    (lib)
    mkDefault
    ;
in {
  imports = [
    ./../../modules/options/default.nix
  ];
  profile = {
    gaming.enable = mkDefault false;
    server.enable = mkDefault false;
    workstation.enable = mkDefault true;
  };

  performance.enable = mkDefault true;

  hyprland = {
    enable = true;
    monitors = {
      configuration = [
        "eDP-1, preferred, auto, 1.333333"
      ];
      #bind = [];
      #rules = [];
    };
  };
}
