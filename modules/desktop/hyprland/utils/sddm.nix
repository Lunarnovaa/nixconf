{
  config,
  pkgs,
  lib,
  ...
}: let
  inherit (lib) mkIf;
  inherit (config.theme) fonts wallpapers;
in {
  config = mkIf config.hyprland.enable {
    environment.systemPackages = [
      (
        pkgs.catppuccin-sddm.override {
          flavor = "mocha";
          font = "${fonts.sans-serif}";
          fontSize = "11";
          background = wallpapers.primary; # for some reason, this doesn't work rn
          loginBackground = true;
        }
      )
    ];
    services.displayManager.sddm = {
      enable = true;
      wayland.enable = true;
      theme = "catppuccin-mocha";
      package = pkgs.kdePackages.sddm;
    };
  };
}
