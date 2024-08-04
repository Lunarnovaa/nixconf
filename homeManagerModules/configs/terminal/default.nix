{
  pkgs,
  lib,
  ...
}: {
  imports = [
    ./wezterm.nix
    ./zsh.nix
    ./spaceship.nix
  ];
}
