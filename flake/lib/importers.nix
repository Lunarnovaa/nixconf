{lib}: let
  inherit (lib.trivial) pipe;
  inherit (lib.strings) hasSuffix hasPrefix;
  inherit (lib.lists) flatten;
  inherit (lib.attrsets) mapAttrsToList filterAttrs;
  inherit (builtins) filter readDir map concatLists;

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

  importNixRecursive = path:
    pipe path [
      listFilesRecursiveClean
      (filter (hasSuffix ".nix")) # Filter non-nix files
    ];

  importModule = pipe ./. [
    importNixRecursive
    (filter (n: n != "module.nix")) # Filter module.nix
  ];

  mkModuleList = {
    moduleDir,
    programs ? [],
    desktop ? ["hyprland"],
  }:
    concatLists [
      (map (n: "${moduleDir}/programs/" + n + "/module.nix") programs)
      (map (n: "${moduleDir}/desktop/" + n + "/module.nix") desktop)
      importNixRecursive "${moduleDir}/common"
    ];

in {
  inherit
    listFilesRecursiveClean
    importNixRecursive
    importModule
    mkModuleList
    ;
  /*
  [
    "hyprland"
    "firefox"
    "gaming"
  ]
  */
}
