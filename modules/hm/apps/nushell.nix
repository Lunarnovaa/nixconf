{
  lib,
  config,
  ...
}: let
  inherit
    (lib)
    mkIf
    ;
in {
  config = mkIf config.nushell.enable {
    programs.nushell = {
      enable = true;
      extraConfig = ''
        $env.config = {
            show_banner: false,
        }

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
      '';
    };
  };
}
