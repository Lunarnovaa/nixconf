{ lib }: {
  extendedLib = {
    generators = import ./generators.nix {inherit lib;};
  };
}