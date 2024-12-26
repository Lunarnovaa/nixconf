{...}: {
  imports = [
    ./drivers/default.nix

    ./bootloader.nix
    ./caches.nix
    ./locales.nix
    ./networking.nix
    ./nix.nix
  ];
}
