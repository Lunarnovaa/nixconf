{
  pkgs,
  lib,
  ...
}: {
  imports = [
    ./alacritty.nix
    ./zsh.nix
    ./spaceship.nix
  ];
}
