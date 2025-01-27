{lib, ...}: let
  inherit (lib.extendedLib.importers) importNixRecursive;
in {
  # rather than relying on a large set of default.nix's sprinkled
  # throughout my config like a skeleton, i simply created a function
  # to import every .nix file under ./modules, excluding any
  # marked with a _ tag :)
  # See function in lib/importers.nix (it's very simple)
  imports = importNixRecursive ./modules;
}
