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
    ./services/stylix.nix

    ./system/nvidia.nix
    ./bundles/gaming.nix
    ./services/minecraft-server.nix
  ];

  nvidia.enable =
    lib.mkDefault false;
  gaming.enable =
    lib.mkDefault false;
  minecraft-server.enable =
    lib.mkDefault false;
}
