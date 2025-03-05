{
  pkgs,
  config,
  lib,
  ...
}: let
  inherit (lib.modules) mkIf;
in {
  config = mkIf config.loose.miniflux {
    hjem.users.lunarnova = {
      packages = [pkgs.miniflux];
    };
  };
}