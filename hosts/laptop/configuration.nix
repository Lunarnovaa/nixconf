{
  config,
  pkgs,
  lib,
  ...
}: {
  imports = [
    ./hardware-configuration.nix
  ];

  # Defining the Hostname
  networking.hostName = "laptop";

  # Specialisation for "Gaming Mode": Enables Gaming Module
  specialisation = {
    gamingMode.configuration = {
      environment.etc."specialisation".text = "gamingMode";
      gaming.enable = lib.mkForce true;
    };
  };

  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.

  # Configuring network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  ##########################
  ## NixOS Module Options ##
  ##########################

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
