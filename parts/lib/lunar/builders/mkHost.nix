libArgs: let
  inherit (libArgs.lib) nixosSystem;
  inherit (libArgs.lib.modules) mkDefault;
  inherit (libArgs.lib.lunar.importers) listNixRecursive;
  inherit (libArgs.lib.lists) flatten singleton;
  inherit (builtins) map concatLists;
in
  # Please note, this fucked up function was inspired by notashelf/nyx,
  # especially the module importing function.
  # Basically, to minimize the re-use of code, I created a custom function
  # calling for all the special details I would need per host.
  # Mainly, it's useful with my flake-parts system to reduce the clutter
  # induced by "withSystem," but the module importing function especially
  # is unique, which imports only the modules needed for the profiles and desktops declared
  {
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
          inherit (libArgs) lib inputs;
          inherit self';
          inherit (config._module.args) theme lunarpkgs;
        };
        modules = let
          top = ../../../../.;
          moduleDir = top + /modules;
          hostDir = top + /hosts;
        in (
          flatten (
            concatLists [
              # singleton just makes a list with one element
              (singleton {
                # Declare the hostName c:
                networking.hostName = hostName;

                nixpkgs = {
                  hostPlatform = mkDefault system;
                };
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
              (listNixRecursive (hostDir + /${hostName}))

              # Additional modules for importation can be declared as well.
              # This is usually system specific stuff.
              specialImports
            ]
          )
        );
      })
