{...}: {
  imports = [
    ./bootloader.nix
    ./caches.nix
    ./locales.nix
    ./networking.nix
    ./nix-ld.nix
    ./nix.nix
    ./nvidia.nix
    ./pam.nix
    ./printing.nix
    ./via.nix
  ];
}
