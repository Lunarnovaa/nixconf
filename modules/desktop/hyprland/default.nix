{...}: {
  imports = [
    ./apps/default.nix
    ./optionals/default.nix
    ./utils/default.nix

    ./binds.nix
    ./config.nix
    ./hyprland.nix
    ./rules.nix
  ];
}
