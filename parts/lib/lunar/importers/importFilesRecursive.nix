libArgs: let
  inherit (libArgs.lib.trivial) pipe;
  inherit (libArgs.lib.strings) removeSuffix;
  inherit (libArgs.lib.attrsets) mapAttrs' nameValuePair;
  inherit (builtins) readDir;

  /*
  Reworked version of 'listFilesRecursive', that instead creates a nested attrset defining the location
  of an imported nix file.


  # Inputs

  `path`

  : The path to recursively create an attrset from..

  # Type

  ```
  Path -> AttrSet
  ```
  */
  importFilesRecursive = path:
    pipe path [
      readDir
      /*
      This is where the "recursive" part of the name comes from. Basically, files are modified as attrs so
      that name is the name of the function, and value is their file imported. Directories are instead
      recursed into, with path extended accordingly. Ultimately, the location of each function is charted
      as it recurses.
      */
      (mapAttrs' (
        name: type:
          if type == "directory"
          then nameValuePair name (importFilesRecursive (path + "/${name}"))
          else
            nameValuePair (
              removeSuffix ".nix" name
            ) (
              import (path + "/${name}") libArgs
            )
      ))
    ];
in
  importFilesRecursive
