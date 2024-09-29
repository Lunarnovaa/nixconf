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
    # Create server profile option
    profile-server.enable =
      mkEnableOption "enables server profile";

    # Create options for server programs
    minecraft-server.enable =
      mkEnableOption "enables minecraft server service";
  };

  # Enable server programs
  config = mkIf config.profile-server.enable {
    minecraft-server.enable = mkDefault true;
  };
}
