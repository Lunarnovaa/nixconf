{ pkgs, lib, ... }: {
  imports = [
    ./bundles/desktop.nix
    ./features/git.nix
  ];
}