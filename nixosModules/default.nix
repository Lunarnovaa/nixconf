{ pkgs, lib, ... }: {
  imports = [ 
    ./services/home-manager.nix #currently, there does not seem to be a need
    ./bundles/general-desktop.nix #to add disable option to these two modules
    ./services/nvidia.nix
    ./bundles/gaming.nix
  ];

  nvidia.enable =
    lib.mkDefault false;
  gaming.enable =
    lib.mkDefault false;
}