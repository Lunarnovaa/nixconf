{ pkgs, lib, ... }: {
  imports = [
    ./bundles/desktop.nix
    ./features/git.nix
    ./features/firefox.nix
  ];

  git.enable =
    lib.mkDefault true;
  firefox.enable =
    lib.mkDefault true;
}