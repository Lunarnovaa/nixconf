{
  lib,
  config,
  pkgs,
  ...
}: let
  inherit
    (lib)
    mkIf
    ;
in {
  config = mkIf config.obsidian.enable {
    home.packages = with pkgs; [obsidian];
  };
}
