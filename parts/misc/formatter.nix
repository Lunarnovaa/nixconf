{
  perSystem = {pkgs, ...}: {
    # Declare the formatter to be called on 'nix fmt'
    formatter = pkgs.alejandra;
  };
}
