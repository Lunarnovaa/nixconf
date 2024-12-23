{...}: {
  # ALlow Unfree Packages
  nixpkgs.config.allowUnfree = true;

  # Enable Flakes
  nix.settings.experimental-features = ["nix-command" "flakes"];

  # Don't change from 24.05
  system.stateVersion = "24.05"; # Did you read the comment?
}
