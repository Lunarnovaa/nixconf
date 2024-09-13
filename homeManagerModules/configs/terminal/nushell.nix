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

      shellAliases = {
        ll = "ls -l";
        ndev = "nix develop --command nu";
      };

      extraConfig = ''
        $env.config = {
          show_banner: false,
        }
      '';
    };
  };
}
