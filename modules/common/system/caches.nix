{...}: let
  inherit (builtins) concatLists;
  substituters = {
    hyprland = ["https://hyprland.cachix.org"];
  };
  trusted-public-keys = {
    hyprland = ["hyprland.cachix.org-1:a7pgxzMz7+chwVL3/pzj6jIBMioiJM7ypFP8PwtkuGc="];
  };
in {
  # Enable caches to avoid building from source
  nix.settings = {
    substituters = with substituters;
      concatLists [
        hyprland
      ];
    trusted-public-keys = with trusted-public-keys;
      concatLists [
        hyprland
      ];
  };
}
