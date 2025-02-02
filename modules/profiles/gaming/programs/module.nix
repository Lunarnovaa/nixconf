{lib}: let
  inherit (lib.extendedLib.importers) importModule;
in {
  imports = importModule;
}
