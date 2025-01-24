{lib, ...}: let
  inherit (lib.filesystem) listFilesRecursive;
  inherit (lib.trivial) pipe;
  inherit (builtins) filter;
  inherit (lib.strings) hasSuffix;
in {
  # rather than relying on a large set of default.nix's sprinkled
  # throughout my config like a skeleton, i simply created a function
  # to import every .nix file under ./modules :)
  imports = pipe ./modules [
    listFilesRecursive
    (filter (hasSuffix ".nix"))
  ];
}