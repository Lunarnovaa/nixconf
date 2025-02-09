{lib, ...}: let
  inherit (lib.extendedLib.importers) listNixRecursive;
in {
  imports = listNixRecursive ./.;
}
