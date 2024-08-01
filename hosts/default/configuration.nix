{
  pkgs,
  lib,
  inputs,
  ...
}: {
  imports = [
    ./hardware-configuration.nix
  ];

  networking.hostName = "default"; # Define your hostname.
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.

  nvidia.enable = lib.mkForce true;
  gaming.enable = lib.mkForce true;
  # enables zsh in config
  programs.zsh.enable = true;

  environment.sessionVariables.MOZ_ENABLE_WAYLAND = "0";

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.lunarnova = {
    isNormalUser = true;
    description = "Aura Cawley";
    extraGroups = ["networkmanager" "wheel"];
    shell = pkgs.zsh;
  };

  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  # programs.gnupg.agent = {
  #   enable = true;
  #   enableSSHSupport = true;
  # };

  # DO NOT CHANGE
  # THIS IS THE NUMBER FROM FIRST INSTALL
  # ORIGINAL IS 24.05 DO NOT CHANGE 24.05
  # NEVER EVER CHANGE
  system.stateVersion = "24.05"; # Did you read the comment? DID YOU????
}
