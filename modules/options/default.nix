{
  lib,
  config,
  ...
}: {
  imports = [
    ./bundles/default.nix
    ./loose/default.nix
    ./profiles/gaming.nix
    ./profiles/server.nix
    ./profiles/workstation.nix
  ];
}
