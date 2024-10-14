{config, ...}: {
  imports = [
    ./apps/default.nix
    ./modules/default.nix
    ./profiles/gaming.nix
    ./profiles/server.nix
    ./profiles/workstation.nix
  ];
}
