{
  lib,
  config,
  pkgs,
  ...
}: let
  inherit (lib) mkIf;
in {
  config = mkIf config.hyprland.enable {
    hjem.users.lunarnova.packages = with pkgs; [nemo];
  };
}
