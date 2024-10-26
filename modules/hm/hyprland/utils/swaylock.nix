{
  config,
  pkgs,
  lib,
  ...
}: let
  inherit
    (lib)
    mkIf
    ;
  inherit
    (config.theme)
    wallpapers
    fonts
    colors
    ;
in {
  config = mkIf config.hyprland.enable {
    programs.swaylock = {
      # referenced in part from notashelf/nyx
      enable = true;
      package = pkgs.swaylock-effects;
      settings = {
        font = fonts.sans-serif;
        font-size = 18;

        image = "${wallpapers.primary}";
        effect-blur = "7x6";

        clock = true;
        indicator = true;
        timestr = "%H:%M";
        datestr = "%e.%m.%y";

        line-color = "${colors.base01}";
        text-color = "${colors.base05}";
        ring-color = "${colors.base00}";
        key-hl-color = "${colors.base08}";

        ring-ver-color = "${colors.base17}";
        inside-ver-color = "${colors.base0E}";

        ring-clear-color = "${colors.base14}";
        inside-clear-color = "${colors.base0B}";

        ring-wrong-color = "${colors.base10}";
        inside-wrong-color = "${colors.base12}";
      };
    };
  };
}
