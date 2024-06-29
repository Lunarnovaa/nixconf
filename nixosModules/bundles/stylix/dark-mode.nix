{
  pkgs,
  lib,
  config,
  ...
}: {

  options = {
    dark-mode.enable =
      lib.mkEnableOption "enables dark-mode";
  };

  config = lib.mkIf config.dark-mode.enable {
    stylix = {
      base16Scheme = "${pkgs.base16-schemes}/share/themes/catppuccin-frappe.yaml";
      #https://tinted-theming.github.io/base16-gallery/
      cursor.name = "Bibata-Modern-Classic";
      image = ./andre-benz.jpg;
    };
  };
  
}