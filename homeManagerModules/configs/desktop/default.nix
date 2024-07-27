{
  pkgs,
  lib,
  ...
}: {
  imports = [
    ./firefox.nix
    ./spotify.nix
    ./newsflash.nix
  ];

  desktop.enable =
    #note: var established in firefox.nix
    lib.mkDefault true;
}
