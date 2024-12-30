{...}: let
  inherit (builtins) concatLists;
  cosmic = {
    substituters = [ "https://cosmic.cachix.org/" ];
    trusted-public-keys = [ "cosmic.cachix.org-1:Dya9IyXD4xdBehWjrkPv6rtxpmMdRel02smYzA85dPE=" ];
  };
  hyprland = {
    substituters = [ "https://hyprland.cachix.org" ];
    trusted-public-keys = [ "hyprland.cachix.org-1:a7pgxzMz7+chwVL3/pzj6jIBMioiJM7ypFP8PwtkuGc=" ];
  };
in {
  # Enable caches to avoid building from source
  nix.settings = {
    substituters = concatLists [
      cosmic.substituters
      hyprland.substituters
    ];
    trusted-public-keys = concatLists [
      cosmic.trusted-public-keys
      hyprland.trusted-public-keys
    ];
  };
}
