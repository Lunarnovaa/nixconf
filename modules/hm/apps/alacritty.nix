{
  inputs,
  lib,
  config,
  pkgs,
  ...
}: let
  inherit
    (lib)
    mkIf
    mkForce
    ;
  inherit (config.theme) colors fonts;
  catppuccin = pkgs.fetchFromGitHub {
    owner = "catppuccin";
    repo = "alacritty";
    rev = "343cf8d65459ac8f6449cc98dd3648bcbd7e3766";
    hash = "sha256-5MUWHXs8vfl2/u6YXB4krT5aLutVssPBr+DiuOdMAto=";
  };
in {
  config = mkIf config.alacritty.enable {
    programs.alacritty = {
      enable = true;
      settings = {
        font = {
          size = fonts.size;
          normal.family = "${fonts.monospace}";
        };
        window.dimensions = {
          lines = 28;
          columns = 101;
        };
        colors = {
          bright = {
            black = "0x${colors.base00}";
            blue = "0x${colors.base0D}";
            cyan = "0x${colors.base0C}";
            green = "0x${colors.base0B}";
            magenta = "0x${colors.base0E}";
            red = "0x${colors.base08}";
            white = "0x${colors.base06}";
            yellow = "0x${colors.base09}";
          };
          cursor = {
            cursor = "0x${colors.base06}";
            text = "0x${colors.base06}";
          };
          normal = {
            black = "0x${colors.base00}";
            blue = "0x${colors.base0D}";
            cyan = "0x${colors.base0C}";
            green = "0x${colors.base0B}";
            magenta = "0x${colors.base0E}";
            red = "0x${colors.base08}";
            white = "0x${colors.base06}";
            yellow = "0x${colors.base0A}";
          };
          primary = {
            background = "0x${colors.base00}";
            foreground = "0x${colors.base06}";
          };
        };
      };
    };
  };
}
