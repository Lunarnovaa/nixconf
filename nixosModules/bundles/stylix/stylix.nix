{
  pkgs,
  lib,
  config,
  ...
}: {

  imports = [
    ./dark-mode.nix
    ./light-mode.nix
  ];

  dark-mode.enable =
    lib.mkDefault true;
  light-mode.enable =
    lib.mkDefault false;

  stylix = {
    enable = true;

    cursor.package = pkgs.bibata-cursors;
    cursor.size = 24;

    fonts = {
      monospace = {
        package = pkgs.nerdfonts.override {fonts = ["JetBrainsMono"];};
        name = "JetBrainsMono Nerd Font Mono";
      };
      sansSerif = {
        package = pkgs.dejavu_fonts;
        name = "DejaVu Sans";
      };
      serif = {
        package = pkgs.dejavu_fonts;
        name = "DejaVu Serif";
      };
      sizes = {
        applications = 10;
        terminal = 15;
        desktop = 10;
        popups = 10;
      };
    };

    opacity = {
      applications = 1.0;
      terminal = 1.0;
      desktop = 1.0;
      popups = 1.0;
    };
  };
}
