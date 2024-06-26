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

  terminal.enable = #note: var established in zsh.nix
    lib.mkDefault true;
}

