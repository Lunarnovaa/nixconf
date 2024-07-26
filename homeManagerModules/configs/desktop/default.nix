{
  pkgs,
  lib,
  ...
}: {
  imports = [
    ./firefox.nix
    ./spotify.nix
    ./newsflashrss.nix
  ];

  desktop.enable =
    #note: var established in firefox.nix
    lib.mkDefault true;
}
