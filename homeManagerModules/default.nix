{
  pkgs,
  lib,
  ...
}: {
  imports = [
    #./bundles/desktop.nix
    ./configs/desktop/default.nix
    ./configs/development/default.nix
    ./configs/terminal/default.nix
    ./configs/fastfetch.nix
    ./configs/obs.nix
  ];

  fastfetch.enable =
    lib.mkDefault true;
}
