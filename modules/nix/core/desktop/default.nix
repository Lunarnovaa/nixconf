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
    ./sddm.nix
    ./shell.nix
  ];
}
