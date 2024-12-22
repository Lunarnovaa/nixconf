{
  lib,
  pkgs,
  config,
  ...
}: let
  inherit
    (lib)
    mkIf
    ;
in {
  config = mkIf config.terminal.apps.spaceship {
    homes.lunarnova = {
      packages = with pkgs; [ starship ];
      files.".config/starship.toml".text = ''
        add_newline = false
      '';
    };
  };
}
