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
  networking.hostName = "procyon";

  # Specialisation for "Gaming Mode": Enables Gaming Module
  specialisation = {
    gamingMode.configuration = {
      environment.etc."specialisation".text = "gamingMode";
      profiles.gaming.enable = mkForce true;
    };
  };
}
