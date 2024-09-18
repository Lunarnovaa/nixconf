{
  inputs,
  lib,
  config,
  ...
}: {
  options = {
    nushell.enable =
      lib.mkEnableOption "enables nushell";
  };

  config = lib.mkIf config.nushell.enable {
    programs.nushell = {
      enable = true;
      extraConfig = ''
        $env.config = {
            show_banner: false,
        }

        alias ll = ls -l
        alias ndev = nix develop --command nu
        def nbuild [] {
            cd ~/nixbuild
            nix develop --command nu
        }

      '';
    };
  };
}
