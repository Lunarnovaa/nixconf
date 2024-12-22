{lib, ...}: let
  inherit
    (lib)
    mkForce
    ;
in {
  imports = [
    ./hardware-configuration.nix
    ./options.nix
  ];
  # Defining the Hostname
  networking.hostName = "polaris";

  # Specialisation for "Focus Mode": Disables Gaming Module
  specialisation = {
    focusMode.configuration = {
      environment.etc."specialisation".text = "focusMode";
      profiles.gaming.enable = mkForce false;
    };
  };
}
