{
  lib,
  config,
  ...
}: {
  imports = [
    ./fastfetch.nix
    ./firefox-vertical-tabs.nix
    ./nvidia.nix
    ./spicetify.nix
  ];
}
