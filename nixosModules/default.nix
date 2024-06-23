{ pkgs, lib, ... }: {
  imports = [ 
    ./bundles/home-manager.nix
    ./bundles/general-desktop.nix
  ];
}