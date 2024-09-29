{
  config,
  pkgs,
  lib,
  ...
}: {
  #################################
  ## Home Manager Module Options ##
  #################################

  spicetify.enable =
    lib.mkForce false;

  obs.enable =
    lib.mkForce false;

  ##################################################################
  ## Danger Zone                                                  ##
  ##################################################################
  ## This number should not be changed in any case.               ##
  ## It is the version number used in the first install.          ##
  ## The version should be "24.05". Do not change it from         ##
  ## "24.05". Just don't.                                         ##
  home.stateVersion = "24.05"; # Did you read the comment?    ##
  ##################################################################
}
