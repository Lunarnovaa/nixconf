{
  inputs,
  lib,
  config,
  ...
}: let
  inherit
    (lib)
    mkIf
    mkForce
    ;
in {
  config = mkIf config.alacritty.enable {
    programs.alacritty = {
      enable = true;
      settings = {
        font.size = mkForce 10;
        window.dimensions = {
          lines = 28;
          columns = 101;
        };
      };
    };
  };
}
