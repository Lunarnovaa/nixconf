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
    vr.enable =
      mkEnableOption "enables vr";
  };

  # Enable gaming programs
  config = mkIf config.profile.gaming.enable {
    obs.enable = mkDefault true;
    vesktop.enable = mkDefault true;
    
    # by default, vr is disabled because due to
    # its particular requirements (performance and hardware),
    # the majority of cases where gaming might be enabled (laptop, steam deck)
    # it will probably not be useful. it is also simply a more niche usecase. 
    vr.enable = mkDefault false;
  };
}
