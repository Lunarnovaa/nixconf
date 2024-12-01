{
  config,
  lib,
  pkgs,
  ...
}: let
  inherit
    (lib)
    mkIf
    ;
in {
  config = mkIf config.profile.gaming.enable {
    environment.systemPackages = with pkgs; [
      lutris
    ];
  };
}
