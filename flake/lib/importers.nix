{lib}: let
  inherit (lib.trivial) pipe;
  inherit (lib.strings) hasSuffix hasPrefix;
  inherit (lib.lists) flatten;
  inherit (lib.attrsets) mapAttrsToList filterAttrs;
  inherit (builtins) filter readDir;
in {
  # simple addition to the listFilesRecursiveClean function
  # to only import nix files created by me
  importNixRecursive = let
    # taken from nixpkgs and modified by me so that any directories
    # with the prefix _ would not have their files imported.
    # please note you can find the original function under
    # lib.filesystem.listFilesRecursive
    listFilesRecursiveClean = dir:
      flatten (mapAttrsToList (
        name: type:
          if type == "directory"
          then listFilesRecursiveClean (dir + "/${name}")
          else dir + "/${name}"
      ) (filterAttrs (n: _: (!hasPrefix "_" n)) (readDir dir)));
  in
    path:
      pipe path [
        listFilesRecursiveClean
        (filter (hasSuffix ".nix")) # Filter non-nix files
      ];
}
