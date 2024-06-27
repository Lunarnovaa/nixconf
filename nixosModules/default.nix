{
  pkgs,
  lib,
  config,
  ...
}: {
  imports = [
    ./services/home-manager.nix #currently, there does not seem to be a need
    ./bundles/general-desktop.nix #to add disable option to these two modules
    ./services/nh.nix #should not be disabled

    ./services/nvidia.nix
    ./bundles/gaming.nix
    ./bundles/stylix/stylix.nix
    ./services/kde.nix
    ./services/x11.nix
  ];

  nvidia.enable =
    lib.mkDefault false;
  gaming.enable =
    lib.mkDefault false;
  kde.enable =
    lib.mkDefault true;
  x11.enable =
    lib.mkDefault true;
}
