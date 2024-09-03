{
  pkgs,
  lib,
  ...
}: {
  imports = [
    ./alacritty.nix
    ./nushell.nix
    ./spaceship.nix
  ];
}
