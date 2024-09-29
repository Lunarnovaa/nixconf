{
  pkgs,
  lib,
  config,
  ...
}: {
  imports = [
    ./fonts.nix
    ./functionality.nix
    ./kde.nix
    ./shell.nix
    ./stylix.nix
  ];

  # Make Chromium + Eectron apps use Wayland
  environment.sessionVariables.NIXOS_OZONE_WL = "1";
}
