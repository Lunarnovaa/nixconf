{
  config,
  pkgs,
  lib,
  theme,
  ...
}: let
  inherit (lib.modules) mkIf;
  inherit (theme) colors fonts;
  toINI = lib.generators.toINIWithGlobalSection {};
  #hyprland-settings = config.wayland.windowManager.hyprland.settings;
in {
  config = mkIf config.hyprland.enable {
    hjem.users.lunarnova = {
      packages = with pkgs; [tofi];
      files.".config/tofi/config".text = toINI {
        globalSection = {
          outline-width = 0;
          border-width = 3;
          corner-radius = 3;
          width = "25%";
          height = "15%";
          font = fonts.sans.path;
          font-size = 13;
          background-color = "${colors.base00}";
          border-color = "${colors.base08}";
          text-color = "${colors.base05}";
          selection-color = "${colors.base12}";
        };
      };
    };
  };
}
