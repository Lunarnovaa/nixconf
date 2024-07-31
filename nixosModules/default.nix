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
    ./bundles/stylix/stylix.nix
  ];

  nvidia.enable =
    lib.mkDefault false;
  gaming.enable =
    lib.mkDefault false;
}
