{
  theme,
  lib,
  ...
}: let
  inherit (theme.fonts) sans;
  inherit (lib.strings) removePrefix;
  inherit (lib.attrsets) mapAttrs;
  inherit (schizoCol) base00 base01 base05 base06;

  schizoCol = mapAttrs (n: v: removePrefix "#" v) theme.colors;
in {
  hjem.users.lunarnova.programs.schizofox = {
    theme = {
      font = sans.name;
      colors = {
        background-darker = base01;
        background = base00;
        foreground = base05;
        primary = base06;
      };
    };
  };
}
