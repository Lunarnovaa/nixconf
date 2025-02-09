{lib, inputs}: {
  extendedLib = {
    builders = import ./builders.nix {inherit lib inputs;};

    generators = import ./generators.nix {inherit lib;};

    importers = import ./importers.nix {inherit lib;};
  };
}
