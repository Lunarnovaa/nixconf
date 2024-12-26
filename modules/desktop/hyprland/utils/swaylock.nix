{
  config,
  lib,
  ...
}: let
  inherit (lib) mkIf concatStrings mapAttrsToList;
  inherit (config.theme) wallpapers fonts colors;
in {
  config = mkIf config.hyprland.enable {
    # The conversion is referenced from https://github.com/nix-community/home-manager
    # It is available under the MIT License
    homes.lunarnova.files.".config/swaylock/config".text = concatStrings (mapAttrsToList (n: v:
      if v == false
      then ""
      else
        (
          if v == true
          then n
          else n + "=" + builtins.toString v
        )
        + "\n") {
      font = fonts.sans-serif;
      font-size = 18;

      image = "${wallpapers.primary}";
      effect-blur = "7x6";

      clock = true;
      indicator = true;
      timestr = "%H:%M";
      datestr = "%m.%d.%y";

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
    });
    security.pam.services = {
      swaylock = {
        name = "swaylock";
        text = ''
          auth  include login
        '';
      };
    };
    # config and pam module both referenced in part from notashelf/nyx
  };
}
