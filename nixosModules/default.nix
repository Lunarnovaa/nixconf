{
  pkgs,
  lib,
  config,
  ...
}: {
  imports = [
    ./services/home-manager.nix #currently, there does not seem to be a need
    ./bundles/general-desktop.nix #to add disable option to these two modules
    ./services/nvidia.nix
    ./bundles/gaming.nix
    ./bundles/stylix/stylix.nix
    ./bundles/kde.nix
  ];

  nvidia.enable =
    lib.mkDefault false;
  gaming.enable =
    lib.mkDefault false;
  kde.enable =
    lib.mkDefault true;
}
