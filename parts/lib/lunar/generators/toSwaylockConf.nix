# Partially taken and modified from https://github.com/nix-community/home-manager
# the function itself is available under the MIT License.
libArgs: {attrs}: let
  inherit (libArgs.lib) concatStrings mapAttrsToList;
in
  concatStrings (mapAttrsToList (n: v:
    if v == false
    then ""
    else
      (
        if v == true
        then n
        else n + "=" + builtins.toString v
      )
      + "\n")
  attrs)
