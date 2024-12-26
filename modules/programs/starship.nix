{
  lib,
  pkgs,
  config,
  ...
}: let
  inherit (lib) mkIf;
  toTOML = (pkgs.formats.toml {}).generate;
in {
  config = mkIf config.terminal.apps.spaceship {
    homes.lunarnova = {
      packages = with pkgs; [starship];
      files.".config/starship.toml".source = toTOML "starship config" {
        add_newline = false;
      };
    };
  };
}
