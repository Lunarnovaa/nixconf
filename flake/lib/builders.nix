{
  lib,
  inputs,
}: let
  inherit (lib) nixosSystem;
  inherit (lib.extendedLib.importers) listNixRecursive;
  inherit (lib.lists) flatten singleton;
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
    withSystem system ({
      self',
      config,
      ...
    }:
      nixosSystem {
        specialArgs = {
          inherit lib inputs self';
          inherit (config._module.args) theme pkgs;
        };
        modules = let
          moduleDir = ../../modules;
        in (
          flatten (
            concatLists [
              (singleton {
                # singleton just makes a list with one element
                # Declare the hostName c:
                networking.hostName = hostName;
              })

              # Import desktop and profile config modules
              (map (n: (moduleDir + /desktop + /${n} + /module.nix)) desktop)
              (map (n: (moduleDir + /profiles + /${n} + /module.nix)) profiles)

              # Import desktop and profile options modules
              # In theory, this shouldn't cause problems, so long as each host
              # import the desktop/profiles that they want to make available & configure
              # I could restructure my config to simplify the function, but I want to make
              # it easier to revert.
              (map (n: (moduleDir + /options/desktop + /${n} + ".nix")) desktop)
              (map (n: (moduleDir + /options/profiles + /${n} + ".nix")) profiles)

              # All hosts import the common modules
              (listNixRecursive (moduleDir + /common))
              (listNixRecursive (moduleDir + /options/common))

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
