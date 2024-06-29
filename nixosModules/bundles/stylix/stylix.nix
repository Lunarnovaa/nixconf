{
  pkgs,
  lib,
  config,
  ...
}: {
  stylix = {
    enable = true;

   # base16Scheme = {
   #   base00 = "171B24";
   #   base01 = "1F2430";
   #   base02 = "242936";
   #   base03 = "707A8C";
   #   base04 = "8A9199";
   #   base05 = "CCCAC2";
   #   base06 = "D9D7CE";
   #   base07 = "F3F4F5";
   #   base08 = "F28779";
   #   base09 = "FFAD66";
   #   base0A = "FFD173";
   #   base0B = "D5FF80";
   #   base0C = "95E6CB";
   #   base0D = "5CCFE6";
   #   base0E = "D4BFFF";
   #   base0F = "F29E74";
   # };

    base16Scheme = "${pkgs.base16-schemes}/share/themes/catppuccin-latte.yaml";
    #https://tinted-theming.github.io/base16-gallery/
    image = ./andre-benz.jpg;

    cursor.package = pkgs.bibata-cursors;
    cursor.name = "Bibata-Modern-Classic";
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
