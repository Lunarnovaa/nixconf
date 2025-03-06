{lib, ...}: let 
  inherit (lib.lists) concatLists;

  # pls ignore this unless you understand the black magic :)
  # basically im just importing a function from my lib manually
  # because at this stage of the flake, my lib has not been extended
  # do NOT try this at home - frankly, i shouldn't be.
  # sometimes i just like to do awful things in my flake for fun
  listNixRecursive = import ./lib/lunar/importers/listNixRecursive.nix {inherit lib;};
in {
  imports = concatLists [
    # Import recursively the ol' fashioned way
    (listNixRecursive ./apps) # Special derivations to be run with 'nix run'
    
    (listNixRecursive ./modules) # Special modules designed to be included in specialArgs
    
    (listNixRecursive ./misc) # Miscellaneous flake settings
    
    # Import only ./default.nix which then uses other means to import
    [
      ./lib # My extended-lib functions

      ./pkgs # My own packages
    ]
  ];
}
