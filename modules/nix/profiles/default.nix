{
  pkgs,
  lib,
  config,
  ...
}: let
  inherit (lib) mkDefault;
in {
  imports = [
    ./gaming/default.nix
    ./server/modules.nix
    #./workstation/modules.nix
  ];

  profile-gaming.enable =
    mkDefault false;
  /*
    profile-server.enable =
    mkDefault false;
  profile-workstation.enable =
    mkDefault false;
  */
}
