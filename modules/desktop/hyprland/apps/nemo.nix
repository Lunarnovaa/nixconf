{
  lib,
  config,
  pkgs,
  ...
}: let
  inherit (lib.modules) mkIf;
in {
  config = mkIf config.hyprland.enable {
    hjem.users.lunarnova.packages = with pkgs; [nemo];
  };
}
