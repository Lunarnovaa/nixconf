{
  config,
  pkgs,
  lib,
  ...
}: {
  imports = [
    ./hardware-configuration.nix
  ];

  specialisation = {
    gaming-mode.configuration = {
      environment.etc."specialisation".text = "gaming-mode";
      gaming.enable = lib.mkForce true;
    };
  };

  dark-mode.enable = lib.mkForce true;
  light-mode.enable = lib.mkForce false;

  networking.hostName = "laptop"; # Define your hostname.
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.

  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  # use the example session manager (no others are packaged yet so this is enabled by default,
  # no need to redefine it in your config for now)
  #media-session.enable = true;

  programs.zsh.enable = true;

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
  system.stateVersion = "24.05"; # Did you read the comment?
}
