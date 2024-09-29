{
  lib,
  config,
  ...
}: let
  inherit (lib) mkEnableOption;
in {
  options = {
    profile-workstation.enable =
      mkEnableOption "enables workstation profile";
  };
}
