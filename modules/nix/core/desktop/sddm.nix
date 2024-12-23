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
          flavor = "macchiato";
          font = "${fonts.sans-serif}";
          fontSize = "11";
          background = "${wallpapers.primary}";
        }
      )
    ];
    services.displayManager.sddm = {
      enable = true;
      wayland.enable = true;
      theme = "catppuccin-macchiato";
      package = pkgs.kdePackages.sddm;
    };
  };
}
