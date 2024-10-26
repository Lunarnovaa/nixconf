{lib, ...}: let
  inherit
    (lib)
    mkDefault
    ;
in {
  imports = [
    ./hardware-configuration.nix
    ./options.nix
  ];
  # Defining the Hostname
  networking.hostName = "procyon";

  # Specialisation for "Gaming Mode": Enables Gaming Module
  specialisation = {
    gamingMode.configuration = {
      environment.etc."specialisation".text = "gamingMode";
      profile.gaming.enable = mkDefault true;
    };
  };

  ##################################################################
  ## Danger Zone                                                  ##
  ##################################################################
  ## This number should not be changed in any case.               ##
  ## It is the version number used in the first install.          ##
  ## The version should be "24.05". Do not change it from         ##
  ## "24.05". Just don't.                                         ##
  system.stateVersion = "24.05"; # Did you read the comment?  ##
  ##################################################################
}
