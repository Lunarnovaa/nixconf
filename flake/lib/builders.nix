{
  lib,
  inputs,
}: let
  inherit (lib) nixosSystem;
  inherit (lib.extendedLib.importers) listNixRecursive;
  inherit (lib.lists) flatten;
  inherit (builtins) map concatLists;
in {
  # Please note, this fucked up function was inspired by notashelf/nyx,
  # especially the module importing function.
  # Basically, to minimize the re-use of code, I created a custom function
  # calling for all the special details I would need per host.
  # Mainly, it's useful with my flake-parts system to reduce the clutter
  # induced by "withSystem," but the module importing function especially
  # is unique, which imports only the modules needed for the profiles and desktops declared
  mkHost = {
    withSystem,
    system,
    hostName,
    profiles ? [],
    desktop ? [],
    specialImports ? [],
  }:
    withSystem system ({self', ...}:
      nixosSystem {
        specialArgs = {
          inherit lib inputs self';
        };
        modules = let
          moduleDir = ../../modules;
        in (
          flatten (
            concatLists [
              [{
                # Declare the hostName c:
                networking.hostName = hostName;
              }]
              # Import desktop and profile modules c:
              (map (n: (moduleDir + /desktop + /${n} + /module.nix)) desktop)
              (map (n: (moduleDir + /profiles + /${n} + /module.nix)) profiles)

              # All hosts import all options and of course the common modules
              (listNixRecursive (moduleDir + /options))
              (listNixRecursive (moduleDir + /common))

              # Import host modules
              (listNixRecursive (../../hosts + /${hostName}))

              # Additional modules for importation can be declared as well.
              # This is usually system specific stuff.
              specialImports
            ]
          )
        );
      });
}
