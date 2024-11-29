{...}: {
  imports = [
    ./bootloader.nix
    ./caches.nix
    ./locales.nix
    ./networking.nix
    ./nix-ld.nix
    ./nvidia.nix
    ./pam.nix
    ./printing.nix
    ./via.nix
  ];

  # ALlow Unfree Packages
  nixpkgs.config.allowUnfree = true;

  # Enable Flakes
  nix.settings.experimental-features = ["nix-command" "flakes"];
}
