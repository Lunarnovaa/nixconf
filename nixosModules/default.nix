{
  pkgs,
  lib,
  config,
  ...
}: {
  imports = [
    # No current reason to disable
    ./system/home-manager.nix
    ./bundles/general-system.nix
    ./bundles/desktop.nix

    ./system/nvidia.nix
    ./bundles/gaming.nix
    ./services/stylix.nix
  ];

  nvidia.enable =
    lib.mkDefault false;
  gaming.enable =
    lib.mkDefault false;
}
