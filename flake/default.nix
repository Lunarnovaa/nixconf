{
  imports = [
    ./apps # Special derivations to be run with 'nix run'

    ./lib # My extended-lib functions

    ./pkgs # My own packages

    ./misc # Miscellaneous flake settings
  ];
}
