{
  lib,
  config,
  ...
}: let
  inherit
    (lib)
    mkEnableOption
    mkIf
    mkDefault
    ;
in {
  options = {
    # Create gaming profile option
    profile.gaming.enable = mkEnableOption "enables gaming profile";

    # Create options for gaming programs
    obs.enable =
      mkEnableOption "enables obs";
    vesktop.enable =
      mkEnableOption "enables vesktop";
  };

  # Enable gaming programs
  config = mkIf config.profile.gaming.enable {
    obs.enable = mkDefault true;
    vesktop.enable = mkDefault true;
  };
}
