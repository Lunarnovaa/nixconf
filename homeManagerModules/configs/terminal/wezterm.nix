{
  inputs,
  lib,
  config,
  ...
}: {
  config = lib.mkIf config.terminal.enable {
    programs.wezterm = {
      enable = true;
      enableZshIntegration = true;
      extraConfig = ''        return {
              font = wezterm.font 'Ubuntu Mono'

             } '';
    };
  };
}
