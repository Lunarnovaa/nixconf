{
  pkgs,
  lib,
  config,
  ...
}: let
  inherit (lib) mkDefault;
in {
  imports = [
    ./core/desktop/default.nix
    ./core/system/default.nix
    ./core/users/default.nix

    ./optionals/default.nix
  ];
}
