{
  lib,
  config,
  pkgs,
  ...
}: let
  inherit (lib) mkIf;
  starshipCache = "${config.homes.lunarnova.directory}/.cache/starship";
in {
  config = mkIf config.terminal.apps.nushell {
    users.users.lunarnova.shell = pkgs.nushell;
    homes.lunarnova = {
      packages = with pkgs; [nushell];
      files = {
        ".config/nushell/config.nu".text = ''

          # disabling the basic banner on startup
          $env.config = {
            show_banner: false,
          }


          # aliases and other stuff

          alias ll = ls -l
          alias ndev = nix develop --command nu

          alias spp = spotify_player

          def nbuild [] {
              cd ~/nix-tools
              nix develop --command nu
          }

          def webdev [--run (-r)] {
            cd ~/aurabora.org
            if $run {
              nix develop --command pnpm run dev
            } else {
              nix develop --command nu
            }
          }


          # starship init

          use ${starshipCache}/init.nu
        '';
        ".config/nushell/env.nu".text = ''
          # defines the starship init process
          mkdir ${starshipCache}
          starship init nu | save -f ${starshipCache}/init.nu
        '';
      };
    };
  };
}
