{
  config,
  lib,
  pkgs,
  ...
}: {
  imports = [
    ./hardware-configuration.nix
  ];
  # Defining the Hostname
  networking.hostName = "default";

  # Specialisation for "Focus Mode": Disables Gaming Module
  specialisation = {
    focusMode.configuration = {
      environment.etc."specialisation".text = "focusMode";
      profile-gaming.enable = lib.mkOverride 45 false; #overrides mkForce
    };
  };

  nvidia.enable =
    lib.mkForce true;

  profile-gaming.enable =
    lib.mkForce true;
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
