{
  inputs,
  lib,
  config,
  ...
}: {
  options = {
    wezterm.enable =
      lib.mkEnableOption "enables wezterm";
  };

  config = lib.mkIf config.wezterm.enable {
    programs.wezterm = {
      enable = true;
      enableZshIntegration = true;
      extraConfig = ''
        return {
          font = wezterm.font 'Ubuntu Mono',

          hide_tab_bar_if_only_one_tab = true,
          prefer_to_spawn_tabs = true,

          initial_cols = 98,
          initial_rows = 26,
        }
      '';
    };
  };
}
