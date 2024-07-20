{
  pkgs,
  lib,
  config,
  ...
}: {
  imports = [
    #need not be disabled
    ./services/home-manager.nix
    ./bundles/general-desktop.nix
    ./services/bootloader.nix

    ./services/nvidia.nix
    ./bundles/gaming.nix
    ./bundles/stylix/stylix.nix
    ./services/kde.nix
    ./services/x11.nix
    #./services/xremap.nix
  ];

  nvidia.enable =
    lib.mkDefault false;
  gaming.enable =
    lib.mkDefault false;
  kde.enable =
    lib.mkDefault true;
  x11.enable =
    lib.mkDefault false;
}
