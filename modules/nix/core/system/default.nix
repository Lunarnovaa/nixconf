{...}: {
  imports = [
    ./bootloader.nix
    ./caches.nix
    ./locales.nix
    ./networking.nix
    ./nix-ld.nix
    ./nixd.nix
    ./nvidia.nix
    ./pam.nix
    ./printing.nix
  ];

  # ALlow Unfree Packages
  nixpkgs.config.allowUnfree = true;

  # Enable Flakes
  nix.settings.experimental-features = ["nix-command" "flakes"];
}
