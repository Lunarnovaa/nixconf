{
  lib,
  config,
  ...
}: {
  imports = [
    ./fastfetch.nix
    ./firefox-vertical-tabs.nix
    ./hyprland.nix
    ./nvidia.nix
    ./performance.nix
    ./spicetify.nix
    ./terminal-bundle.nix
  ];
}
