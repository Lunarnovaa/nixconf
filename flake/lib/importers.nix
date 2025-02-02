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
    profiles ? [],
    desktop ? ["hyprland"],
    specialImports ? [],
    hostModule
  }:
    concatLists [
      (map (n: "${moduleDir}/options/profiles/" + n + ".nix") profiles)
      (map (n: "${moduleDir}/desktop/" + n + "/module.nix") desktop)
      (map (n: "${moduleDir}/profiles/" + n + "/module.nix") profiles)

      (importNixRecursive "${moduleDir}/common")
      (importNixRecursive hostModule)

      specialImports
    ];
in {
  inherit
    listFilesRecursiveClean
    importNixRecursive
    importModule
    mkModuleList
    ;
}
