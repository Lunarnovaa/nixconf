{
  lib,
  config,
  ...
}: let
  inherit (lib) mkEnableOption;
in {
  options = {
    profile-server.enable =
      mkEnableOption "enables server profile";
  };
}
