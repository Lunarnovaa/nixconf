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
      files.".config/starship.toml".source = ((pkgs.formats.toml {}).generate "starship config" {
        add_newline = false;
      });
    };
  };
}
