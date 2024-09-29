{
  lib,
  config,
  ...
}: let
  inherit (lib) mkIf mkDefault;
in {
  options = 
  config = mkIf config.profile-gaming.enable {
    m
  };

}
