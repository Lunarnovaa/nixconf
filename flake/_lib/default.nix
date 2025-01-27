{lib}: {
  extendedLib = {
    generators = import ./generators.nix {inherit lib;};

    importers = import ./importers.nix {inherit lib;};
  };
}