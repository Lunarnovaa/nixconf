{...}: let
  inherit (builtins) concatLists;
  hyprland = {
    substituters = ["https://hyprland.cachix.org"];
    trusted-public-keys = ["hyprland.cachix.org-1:a7pgxzMz7+chwVL3/pzj6jIBMioiJM7ypFP8PwtkuGc="];
  };
in {
  # Enable caches to avoid building from source
  nix.settings = {
    substituters = concatLists [
      hyprland.substituters
    ];
    trusted-public-keys = concatLists [
      hyprland.trusted-public-keys
    ];
  };
}
