# Credit to @notashelf for nyx which I learned how to extend lib in flake-parts from.
# My implementation is a little janky, but works great.
{inputs, ...}: let
  inherit (inputs.nixpkgs) lib;
  extended-lib = lib.extend (final: prev:
    import ./extension.nix {
      lib = final;
      inherit inputs;
    });
in {
  perSystem = {
    # Extend lib for the flake
    _module.args.lib = extended-lib;
  };
  flake = {
    # And also as an output
    lib = extended-lib;
  };
}
