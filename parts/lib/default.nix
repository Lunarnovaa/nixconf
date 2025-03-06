# Credit to @notashelf for nyx which I learned how to extend lib in flake-parts from.
# My implementation is a little janky, but works great.
{inputs, ...}: let
  lunar.lib = inputs.nixpkgs.lib.extend (
    final: prev: {
      lunar =
        (import ./lunar/importers/importFilesRecursive.nix {
          lib = final;
          inherit inputs;
        })
        ./lunar;
    }
  );
in {
  perSystem = {
    # Extend lib for the flake
    _module.args = {inherit (lunar) lib;};
  };
  # And also as an output
  flake = {inherit (lunar) lib;};
}
