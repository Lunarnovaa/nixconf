{
  inputs,
  lib,
  config,
  pkgs,
  ...
}: {
  qt = {
    enable = true;
    style = {
      package = pkgs.catppuccin-kde.override {
        flavour = ["macchiato"];
        accents = ["red"];
      };
      name = "Catppuccin-Macchiato-Dark";
    };
  };
}
