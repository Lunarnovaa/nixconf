{
  pkgs,
  lib,
  config,
  ...
}: {
  imports = [
    ./fonts.nix
    ./functionality.nix
    ./hyprland.nix
    ./kde.nix
    ./shell.nix
  ];
}
